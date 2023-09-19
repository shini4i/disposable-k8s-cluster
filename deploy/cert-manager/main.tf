resource "kubernetes_namespace" "this" {
  metadata {
    name = "cert-manager"
  }
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = "cert-manager"
  }

  data = {
    api-token = var.cloudflare_api_token
  }
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/cert-manager.tftpl", {
    cm-targetRevision  = var.chart_version
    cmi-targetRevision = var.cert_manager_issuers_chart_version
    domain             = var.domain
    use_staging_server = var.le_use_stage_issuer
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [
    kubernetes_namespace.this,
    kubernetes_secret.this
  ]
}
