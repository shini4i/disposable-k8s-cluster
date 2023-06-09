resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-token"
    namespace = "kube-system"
  }

  data = {
    cloudflare_api_token = var.cloudflare_api_token
  }
}

locals {
  external_dns = templatefile("${path.module}/templates/external-dns.tftpl", {
    fqdn           = var.domain
    targetRevision = var.chart_version
  })
}

resource "kubectl_manifest" "external-dns" {
  yaml_body  = local.external_dns
  wait       = true
  depends_on = [kubernetes_secret.this]
}
