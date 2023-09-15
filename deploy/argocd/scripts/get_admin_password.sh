#!/usr/bin/env bash

set -e

export KUBECONFIG=../kubeconfig

get_admin_password() {
  PASSWORD=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

  if [ -z "$PASSWORD" ]; then
    echo "Error: Failed to retrieve ArgoCD admin password."
    exit 1
  fi

  echo "{\"ADMIN_PASSWORD\":\"$PASSWORD\"}"
}

main() {
  get_admin_password
}

main "$@"
