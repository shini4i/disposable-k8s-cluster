variable "chart_version" {}
variable "cert_manager_issuers_chart_version" {
  description = "Version of the cert-manager-issuers chart to use"
  default     = "0.2.5"
}
variable "cloudflare_api_token" {}
variable "domain" {}
variable "wildcard_enabled" {
  description = "Issue a wildcard certificate"
}
variable "le_use_stage_issuer" {
  description = "Use Let's Encrypt staging server"
  default     = false
}
