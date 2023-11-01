output "argo_watcher_deploy_token" {
  description = "The deploy token used to validate tasks for the Argo Watcher"
  value       = var.argo_watcher_enabled ? module.argo-watcher[0].argo_watcher_deploy_token : null
}

output "argo_cd_url" {
  description = "The URL of the Argo CD instance"
  value       = "https://argo-cd.${var.domain}"
}

output "argo_cd_username" {
  description = "The username of the Argo CD admin user"
  value       = "admin"
}

output "argo_cd_password" {
  description = "The password of the Argo CD admin user"
  value       = nonsensitive(module.argo-cd.admin_password)
}

output "argo_watcher_ssh_public_key" {
  description = "The SSH public key used by the Argo Watcher to commit changes to the gtiops repository"
  value       = module.argo-watcher[0].ssh_public_key
}
