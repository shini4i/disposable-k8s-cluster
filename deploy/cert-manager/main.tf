resource "kubernetes_namespace" "this" {
  metadata {
    name = "cert-manager"
    labels = {
      managed-by = "terraform"
    }
    annotations = {
      bootstrapped_by = "https://github.com/shini4i/disposable-k8s-cluster"
    }
  }
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = kubernetes_namespace.this.metadata[0].name
  }

  data = {
    api-token = var.cloudflare_api_token
  }
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/cert-manager.tftpl", {
    cm-targetRevision      = var.chart_version
    cmi-targetRevision     = var.cert_manager_issuers_chart_version
    domain                 = var.domain
    use_staging_server     = var.le_use_stage_issuer
    cloudflare_secret_name = kubernetes_secret.this.metadata[0].name
    namespace              = kubernetes_namespace.this.metadata[0].name
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }
}
