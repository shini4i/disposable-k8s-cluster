#!/usr/bin/env bash

set -e

export KUBECONFIG=../kubeconfig

TMP_FILE="/tmp/disposable-argo-token"

check_dependencies() {
  for dep in kubectl curl jq; do
    if ! command -v $dep &> /dev/null; then
      echo "Error: $dep is not installed."
      exit 1
    fi
  done
}

create_argo_cd_token() {
  local token

  # Check if the temporary file exists
  if [ -f "$TMP_FILE" ]; then
    # If it does, read the token from the file
    token=$(cat "$TMP_FILE")
  else
    token=$(curl -s -H "Authorization: Bearer $ARGO_TOKEN" -XPOST http://localhost:8080/api/v1/account/admin/token -d $'{"id": "demo"}' | jq -r '.token')

    # Store the token value in the temporary file
    echo "$token" > "$TMP_FILE"
  fi

  echo "{\"ARGO_TOKEN\":\"$token\"}"
}

auth() {
  ARGO_TOKEN=$(curl -s -k http://localhost:8080/api/v1/session -d "{\"username\":\"admin\",\"password\":\"$PASSWORD\"}" | jq -r '.token')

  if [ -z "$ARGO_TOKEN" ]; then
    echo "Error: Failed to authenticate to ArgoCD."
    exit 1
  fi
}

get_admin_password() {
  PASSWORD=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

  if [ -z "$PASSWORD" ]; then
    echo "Error: Failed to retrieve ArgoCD admin password."
    exit 1
  fi
}

start_port_forwarding() {
  kubectl -n argo-cd port-forward svc/argo-cd-server 8080:443 &> /dev/null &
  local PF_PID=$!          # Get the process ID of the last background command
  trap "kill $PF_PID" EXIT # Ensure that the port-forwarding process is terminated when the script exits
  sleep 5                  # Give some time for port-forwarding to start
}

main() {
  check_dependencies
  get_admin_password
  start_port_forwarding
  auth
  create_argo_cd_token
}

main "$@"
