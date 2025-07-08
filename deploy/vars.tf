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
  description = "Argo CD chart version"
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
  description = "Git repository contains for common"
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
  description = "Kubernetes addons"
  type        = any
}

variable "ingress_controller" {
  description = "Ingress controller to use"
  type        = string
}

variable "ingress_controller_chart_versions" {
  description = "A list of ingress controller chart versions"
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
