locals {
  traefik = templatefile("${path.module}/templates/traefik.tpl", {
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  })
}

resource "kubectl_manifest" "traefik" {
  yaml_body  = local.traefik
  wait       = true
}
