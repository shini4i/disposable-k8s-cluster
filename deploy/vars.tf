variable "argo_cd_chart_version" {
  description = "Argo CD chart version"
}

variable "argo_watcher_chart_version" {
  description = "Argo CD chart version"
}

variable "argo_watcher_enabled" {
  description = "If Argo-Watcher should be installed"
  type        = bool
}

variable "argo_watcher_image_tag_override" {
  description = "Image override for Argo-Watcher"
}

variable "traefik_chart_version" {
  description = "Traefik chart version"
}

variable "reflector_chart_version" {
  description = "Reflector chart version"
}

variable "cert_manager_chart_version" {
  description = "Cert Manager chart version"
}

variable "external_dns_chart_version" {
  description = "External DNS chart version"
}

variable "domain" {
  description = "Domain to use for the cluster"
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  default     = ""
}

variable "le_use_stage_issuer" {
  description = "Use the Let's Encrypt staging issuer"
  type        = bool
}

variable "cloud_provider" {
  description = "Cloud provider to use"
}

variable "skip_expose" {
  description = "If cert-manager and external-dns installation should be skipped"
  type        = bool
}

variable "application_set_enabled" {
  description = "If ApplicationSet controller should be installed"
  type        = bool
}
