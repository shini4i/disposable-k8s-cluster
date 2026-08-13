variable "ingress_controller" {
  type        = string
  description = "which ingress controller to use"
  default     = "traefik"

  validation {
    condition     = contains(keys(var.ingress_controller_templates), var.ingress_controller)
    error_message = "No template registered for '${var.ingress_controller}'; add one to ingress_controller_templates."
  }
}

# To add another ingress controller, drop a template into templates/, map its
# name here, and add a matching entry to ingress_controller_chart_versions.
variable "ingress_controller_templates" {
  description = "Mapping of ingress controller name to the Argo CD Application template rendering it"
  type        = map(string)
  default = {
    traefik = "traefik.tftpl"
  }
}

variable "ingress_controller_chart_versions" {
  type        = map(string)
  description = "Chart version per supported ingress controller, keyed by controller name"
}

variable "local_setup" {
  description = "Whether the setup is KIND based or not, which exposes the controller via NodePort"
  type        = bool
}
