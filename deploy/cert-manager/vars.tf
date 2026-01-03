variable "chart_version" {
  type = string
}
variable "cert_manager_issuers_chart_version" {
  description = "Version of the cert-manager-issuers chart to use"
  default     = "0.2.5"
  type        = string
}
variable "cloudflare_api_token" {
  description = "Cloudflare API token for DNS validation"
  type        = string
  sensitive   = true
}
variable "domain" {
  type = string
}
variable "wildcard_enabled" {
  description = "Issue a wildcard certificate"
  default     = false
  type        = bool
}
variable "le_use_stage_issuer" {
  description = "Use Let's Encrypt staging server"
  default     = false
  type        = bool
}
variable "raw_chart_version" {
  description = "RAW chart version"
  default     = "2.0.0"
  type        = string
}
