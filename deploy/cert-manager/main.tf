locals {
  cert-manager = templatefile("${path.module}/templates/cert-manager.tpl", {
    targetRevision = var.chart_version
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

resource "kubectl_manifest" "this" {
  count = var.le_use_stage_issuer ? 0 : 1

  yaml_body  = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
 name: le-disposable-dns
 namespace: cert-manager
spec:
 acme:
   email: disposable@${var.domain}
   server: https://acme-v02.api.letsencrypt.org/directory
   privateKeySecretRef:
     name: disposable-issuer-account-key
   solvers:
     - dns01:
         cloudflare:
           apiTokenSecretRef:
             name: cloudflare-api-token-secret
             key: api-token
YAML
  depends_on = [
    kubernetes_secret.this
  ]
}

resource "kubectl_manifest" "this_staging" {
  count = var.le_use_stage_issuer ? 1 : 0

  yaml_body  = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
 name: le-disposable-dns
 namespace: cert-manager
spec:
 acme:
   email: disposable@${var.domain}
   server: https://acme-staging-v02.api.letsencrypt.org/directory
   privateKeySecretRef:
     name: disposable-issuer-account-key
   solvers:
     - dns01:
         cloudflare:
           apiTokenSecretRef:
             name: cloudflare-api-token-secret
             key: api-token
YAML
  depends_on = [
    kubernetes_secret.this
  ]
}
