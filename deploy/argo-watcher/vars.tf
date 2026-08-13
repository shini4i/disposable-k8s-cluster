variable "chart_version" {
  description = "The version of the chart to deploy"
  type        = string
}

variable "domain" {
  description = "The domain to use for the ingress"
  type        = string
}

variable "namespace" {
  description = "The namespace to deploy the chart into"
  default     = "argo-watcher"
  type        = string
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

variable "raw_chart_version" {
  description = "Version of the bedag/raw chart used to deliver the postgresql cluster manifest"
  default     = "2.0.2"
  type        = string
}

variable "postgres_operator_namespace" {
  description = "Namespace the Zalando operator runs in, allowed to reach the database"
  default     = "postgres-operator"
  type        = string
}

variable "postgres_team_id" {
  description = "teamId of the postgresql cluster, required by the Zalando operator"
  default     = "disposable"
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL major version to run"
  default     = "18"
  type        = string
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
