variable "argo_cd_chart_version" {
  description = "Argo CD chart version"
  type        = string
}

variable "use_custom_argocd_image" {
  description = "If custom Argo CD image should be used (for repoServer)"
  type        = bool
}

variable "custom_argocd_image" {
  description = "Custom Argo CD image (for repoServer)"
  type        = string
}

variable "custom_argocd_image_tag" {
  description = "Custom Argo CD image tag (for repoServer)"
  type        = string
}

variable "argo_watcher_chart_version" {
  description = "Argo Watcher chart version"
  type        = string
}

variable "argo_watcher_enabled" {
  description = "If Argo-Watcher should be installed"
  type        = bool
}

variable "argo_watcher_image_tag_override" {
  description = "Image override for Argo-Watcher"
  type        = string
}

variable "argo_watcher_persistence_enabled" {
  description = "If persistence should be enabled for Argo-Watcher"
  type        = bool

  # The postgresql cluster is reconciled by the Zalando operator, which ships as
  # an ApplicationSet addon. Without it nothing serves the CR and the module
  # waits for a Healthy Application that never arrives.
  validation {
    condition = !(var.argo_watcher_enabled && var.argo_watcher_persistence_enabled) || (
      var.application_set_enabled && var.argocd_applicationset_addons.enable_postgres_operator
    )
    error_message = "argo_watcher_persistence_enabled requires application_set_enabled and argocd_applicationset_addons.enable_postgres_operator."
  }
}

variable "cert_manager_chart_version" {
  description = "Cert Manager chart version"
  type        = string
}

variable "cert_manager_wildcard_enabled" {
  description = "Issue a wildcard certificate"
  type        = bool
  default     = false
}

variable "external_dns_chart_version" {
  description = "External DNS chart version"
  type        = string
}

variable "domain" {
  description = "Domain to use for the cluster"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  sensitive   = true
  default     = ""
  type        = string
}

variable "le_use_stage_issuer" {
  description = "Use the Let's Encrypt staging issuer"
  type        = bool
}

variable "cloud_provider" {
  description = "Cloud provider to use"
  type        = string

  validation {
    condition     = contains(["kind", "digitalocean"], var.cloud_provider)
    error_message = "Cloud provider must be 'kind' or 'digitalocean'."
  }
}

variable "skip_expose" {
  description = "If cert-manager and external-dns installation should be skipped"
  type        = bool
}

variable "application_set_enabled" {
  description = "If ApplicationSet controller should be installed"
  type        = bool
}

variable "gitops_common_repo" {
  description = "Git repository URL for common addons"
  type        = string
}

variable "gitops_common_revision" {
  description = "Git repository revision/branch/ref for common"
  type        = string
}

variable "gitops_common_basepath" {
  description = "Git repository base path for common"
  type        = string
}

variable "gitops_common_path" {
  description = "Git repository path for common"
  type        = string
}

variable "argocd_applicationset_addons" {
  description = "ApplicationSet addons configuration"
  type = object({
    enable_sealed_secrets    = optional(bool, false)
    enable_reflector         = optional(bool, false)
    enable_argo_workflows    = optional(bool, false)
    enable_argo_rollouts     = optional(bool, false)
    enable_postgres_operator = optional(bool, false)
  })
}

variable "ingress_controller" {
  description = "Ingress controller to use"
  type        = string

  validation {
    condition     = contains(keys(var.ingress_controller_chart_versions), var.ingress_controller)
    error_message = "Ingress controller must be one of: ${join(", ", keys(var.ingress_controller_chart_versions))}."
  }
}

variable "ingress_controller_chart_versions" {
  description = "Chart version per supported ingress controller, keyed by controller name"
  type        = map(string)
}

variable "gitlab_runner_enabled" {
  description = "If GitLab Runner should be installed"
  type        = bool
}

variable "gitlab_url" {
  description = "Gitlab URL to use for GitLab Runner"
  default     = "https://gitlab.com/"
  type        = string
}

variable "gitlab_runner_chart_version" {
  description = "GitLab Runner chart version"
  type        = string
}

variable "gitlab_runner_token" {
  description = "GitLab Runner registration token"
  type        = string
  default     = ""
  sensitive   = true
}

variable "netpol_enabled" {
  description = "If network policies should be enabled"
  type        = bool
  default     = false
}
