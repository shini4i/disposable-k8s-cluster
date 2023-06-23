variable "chart_version" {}
variable "cloudflare_api_token" {}
variable "domain" {}
variable "le_use_stage_issuer" {
  description = "Use Let's Encrypt staging server"
  default     = false
}
