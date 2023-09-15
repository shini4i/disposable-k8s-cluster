locals {
  argo_watcher = templatefile("${path.module}/templates/argo-watcher.tftpl", {
    domain         = var.domain
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  })
}

resource "argocd_account_token" "this" {
  account     = "admin"
  renew_after = "168h"
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "argo-watcher-secret"
    namespace = var.namespace
  }

  data = {
    ARGO_TOKEN = argocd_account_token.this.jwt
  }
}

resource "kubectl_manifest" "argo-watcher" {
  yaml_body  = local.argo_watcher
  wait       = true
  depends_on = [kubernetes_secret.this]
}
