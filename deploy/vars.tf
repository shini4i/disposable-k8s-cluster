variable "argo_cd_chart_version" {}
variable "traefik_chart_version" {}
variable "cert_manager_chart_version" {}
variable "external_dns_chart_version" {}
variable "domain" {}
variable "cloudflare_api_token" {}
variable "le_use_stage_issuer" { type = bool }
variable "cloud_provider" {}
variable "skip_expose" { type = bool }
