#!/usr/bin/env bash

create_argo_cd_token() {
  local token
  echo "===> Generating a permanent ArgoCD token..."
  token=$(curl -s -H "Authorization: Bearer $ARGO_TOKEN" -XPOST https://argo-cd.disposable.name/api/v1/account/admin/token -d $'{"id": "demo"}' | jq -r '.token')
  echo ArgoCD token: "$token"
}

# auth will generate a temporary token for ArgoCD that is set to expire
auth () {
  local password="$1"
  echo "===> Authenticating to ArgoCD..."
  ARGO_TOKEN=$(curl -s https://argo-cd.disposable.name/api/v1/session -d "{\"username\":\"admin\",\"password\":\"$password\"}" | jq -r '.token')
}

main () {
  auth "$@"
  create_argo_cd_token
}

main "$@"
