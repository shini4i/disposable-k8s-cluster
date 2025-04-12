variable "chart_version" {
  description = "The version of the chart to deploy"
}

variable "domain" {
  description = "The domain to use for the ingress"
}

variable "namespace" {
  description = "The namespace to deploy the chart into"
  default     = "argo-watcher"
}

variable "local_setup" {
  description = "Whether the setup is KIND based or not"
  type        = bool
}

variable "image_tag" {
  description = "The image tag to use for the deployment"
  type        = string
}

variable "persistence_enabled" {
  description = "Whether to enable persistence or not"
  type        = bool
}
