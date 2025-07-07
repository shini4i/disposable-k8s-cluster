variable "chart_version" {}
variable "domain" {}
variable "namespace" {
  default = "argo-cd"
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
variable "custom_argocd_image" {}
variable "custom_argocd_image_tag" {}
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

variable "use_wildcard_certificate" {
  description = "Whether to use a wildcard certificate for the ingress"
  type        = bool
  default     = false
}
