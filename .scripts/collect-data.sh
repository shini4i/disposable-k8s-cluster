#!/usr/bin/env bash
# This script is used to generate data about ephemeral environment

set -e

collect_argo_cd_details() {
  local argoCdUrl
  local argoCdAdminPassword

  argoCdUrl=https://$(kubectl get ing argo-cd-server -n argo-cd -o jsonpath='{.spec.rules[0].host}')
  argoCdAdminPassword=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

  echo "ArgoCD connection details:"
  echo "url: $argoCdUrl"
  echo "username: admin"
  echo "password: $argoCdAdminPassword"
}

main() {
  echo "Collecting ephemeral environment details..."
  collect_argo_cd_details
}

main
