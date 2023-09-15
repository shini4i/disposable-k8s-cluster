resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/traefik.tftpl", {
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }
}
