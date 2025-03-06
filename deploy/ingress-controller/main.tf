resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/${var.ingress_controller_templates[var.ingress_controller]}", {
    targetRevision = var.ingress_controller_chart_versions[var.ingress_controller]
    local_setup    = var.local_setup
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }
}
