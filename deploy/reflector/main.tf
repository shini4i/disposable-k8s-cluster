resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/reflector.tftpl", {
    targetRevision = var.chart_version
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }
}
