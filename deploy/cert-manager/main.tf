resource "kubernetes_namespace" "this" {
  metadata {
    name = "cert-manager"
  }
}

resource "kubernetes_manifest" "cert_manager" {
  manifest = yamldecode(templatefile("${path.module}/templates/cert-manager.tftpl", {
    targetRevision = var.chart_version
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [
    kubernetes_namespace.this
  ]
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = "cert-manager"
  }

  data = {
    api-token = var.cloudflare_api_token
  }

  depends_on = [
    kubernetes_manifest.cert_manager
  ]
}

resource "kubernetes_manifest" "cluster_issuer" {
  manifest = yamldecode(templatefile("${path.module}/templates/cluster-issuer.tftpl", {
    domain             = var.domain
    use_staging_server = var.le_use_stage_issuer
    targetRevision     = "0.2.5"
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [
    kubernetes_secret.this
  ]
}
