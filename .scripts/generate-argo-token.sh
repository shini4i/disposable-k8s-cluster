#!/usr/bin/env bash

set -e

create_argo_cd_token() {
  local domain="$1"
  local token

  echo "===> Generating a permanent ArgoCD token..."
  token=$(curl -s -k -H "Authorization: Bearer $ARGO_TOKEN" -XPOST https://argo-cd."$domain"/api/v1/account/admin/token -d $'{"id": "demo"}' | jq -r '.token')
  echo ArgoCD token: "$token"
}

auth() {
  local domain="$1"
  echo "===> Authenticating to ArgoCD..."
  ARGO_TOKEN=$(curl -s -k https://argo-cd."$domain"/api/v1/session -d "{\"username\":\"admin\",\"password\":\"$PASSWORD\"}" | jq -r '.token')
}

get_admin_password() {
  echo "===> Collecting ArgoCD admin password..."
  PASSWORD=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
}

main () {
  get_admin_password
  auth "$1"
  create_argo_cd_token "$1"
}

main "$@"
