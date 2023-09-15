output "argo_watcher_deploy_token" {
  value = module.argo-watcher[0].argo_watcher_deploy_token
}

output "argo_cd_url" {
  value = "https://argo-cd.${var.domain}"
}

output "argo_cd_username" {
  value = "admin"
}

output "argo_cd_password" {
  value = nonsensitive(module.argo-cd.admin_password)
}
