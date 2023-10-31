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
