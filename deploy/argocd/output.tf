output "admin_password" {
  value = data.kubernetes_secret_v1.admin_password.data["password"]
}
