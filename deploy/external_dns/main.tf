resource "kubernetes_secret" "this" {
  metadata {
    name = "cloudflare-token"
    namespace = "kube-system"
  }

  data = {
    cloudflare_api_token = var.cloudflare_api_token
  }
}

resource "helm_release" "this" {
  name      = "external-dns"
  namespace = "kube-system"

  version = var.chart_version

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"

  max_history = 1
  timeout     = 600

  values = [
    templatefile(
      "${path.module}/templates/external-dns.tpl",
      {
        fqdn          = var.domain
      })
  ]

  depends_on = [
    kubernetes_secret.this
  ]
}
