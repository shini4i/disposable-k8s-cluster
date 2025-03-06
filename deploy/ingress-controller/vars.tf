variable "ingress_controller" {
  type        = string
  description = "which ingress controller to use"
  default     = "traefik"
}

variable "ingress_controller_templates" {
  type = map(string)
  default = {
    traefik       = "traefik.tftpl"
    ingress-nginx = "ingress-nginx.tftpl"
  }
}

variable "ingress_controller_chart_versions" {
  type        = map(string)
  description = "A list of ingress controller chart versions"
}

variable "local_setup" {
  type = bool
}
