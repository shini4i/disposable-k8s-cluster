output "argo_watcher_deploy_token" {
  description = "Argo Watcher deploy token"
  value       = random_string.this.result
}

output "ssh_public_key" {
  description = "The SSH public key used by the Argo Watcher to commit changes to the gitops repository"
  value       = tls_private_key.this.public_key_openssh
}
