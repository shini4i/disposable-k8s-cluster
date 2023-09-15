output "argo_watcher_deploy_token" {
  description = "Argo Watcher deploy token"
  value       = random_string.this.result
}
