#!/usr/bin/env bash
# This script is used to generate data about ephemeral environment

set -e

wait_for_app() {
  local app_name="$1"
  local namespace="$2"

  echo "===> Waiting for application $app_name to reach both Healthy and Synced state..."

  while [[ $(kubectl get app/"$app_name" -n "$namespace" -o 'jsonpath={.status.health.status}') != "Healthy" ]]; do
    sleep 5
  done

  echo "Application $app_name is now Healthy."

  while [[ $(kubectl get app/"$app_name" -n "$namespace" -o 'jsonpath={.status.sync.status}') != "Synced" ]]; do
    sleep 5
  done

  echo "Application $app_name is now Synced."
}

collect_argo_cd_details() {
  local argoCdUrl
  local argoCdAdminPassword

  echo "===> Collecting ArgoCD connection details..."

  argoCdUrl=https://$(kubectl get ing argo-cd-server -n argo-cd -o jsonpath='{.spec.rules[0].host}')
  argoCdAdminPassword=$(kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

  echo "url: $argoCdUrl"
  echo "username: admin"
  echo "password: $argoCdAdminPassword"
}

main() {
  printf "\n===> Collecting ephemeral environment details...\n"
  wait_for_app traefik argo-cd
  collect_argo_cd_details
}

main
