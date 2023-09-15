variable "chart_version" {}
variable "domain" {}
variable "namespace" { default = "argo-cd" }
variable "local_setup" {
  type = bool
}
