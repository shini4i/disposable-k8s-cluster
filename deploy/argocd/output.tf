output "admin_password" {
  value = data.kubernetes_secret.admin_password.data["password"]
}
