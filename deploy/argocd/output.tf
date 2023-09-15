output "admin_password" {
  value = data.external.admin_password.result["ADMIN_PASSWORD"]
}
