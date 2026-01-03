variable "chart_version" {
  type = string
}
variable "domain" {
  type = string
}
variable "namespace" {
  default = "argo-cd"
  type    = string
}
variable "local_setup" {
  type = bool
}
variable "application_set_enabled" {
  description = "If ApplicationSet controller should be installed"
  type        = bool
}
variable "use_custom_argocd_image" {
  type    = bool
  default = false
}
variable "custom_argocd_image" {
  type = string
}
variable "custom_argocd_image_tag" {
  type = string
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
    enable_sealed_secrets = optional(bool, false)
    enable_reflector      = optional(bool, false)
    enable_argo_workflows = optional(bool, false)
    enable_argo_rollouts  = optional(bool, false)
  })
}

variable "use_wildcard_certificate" {
  description = "Whether to use a wildcard certificate for the ingress"
  type        = bool
  default     = false
}

variable "netpol_enabled" {
  description = "Whether to enable the network policies or not"
  type        = bool
  default     = false
}
