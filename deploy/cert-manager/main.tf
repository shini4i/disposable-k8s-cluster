locals {
  cert-manager = templatefile("${path.module}/templates/cert-manager.tpl", {
    targetRevision = var.chart_version
  })
  clusterIssuer = templatefile("${path.module}/templates/cluster-issuer.tpl", {
    domain             = var.domain
    use_staging_server = var.le_use_stage_issuer
    targetRevision     = "0.2.5"
  })
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = "cert-manager"
  }
}

resource "kubectl_manifest" "cert-manager" {
  yaml_body = local.cert-manager
  wait      = true

  depends_on = [kubernetes_namespace.this]
}


resource "kubernetes_secret" "this" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = "cert-manager"
  }

  data = {
    api-token = var.cloudflare_api_token
  }

  depends_on = [kubectl_manifest.cert-manager]
}

resource "kubectl_manifest" "cluster-issuer" {
  yaml_body  = local.clusterIssuer
  wait       = true
  depends_on = [kubernetes_secret.this]
}
