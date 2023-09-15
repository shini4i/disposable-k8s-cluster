resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-token"
    namespace = "kube-system"
  }

  data = {
    cloudflare_api_token = var.cloudflare_api_token
  }
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/external-dns.tftpl", {
    fqdn           = var.domain
    targetRevision = var.chart_version
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
