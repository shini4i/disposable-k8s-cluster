locals {
  argo_watcher = templatefile("${path.module}/templates/argo-watcher.tftpl", {
    domain         = var.domain
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  })
}

resource "argocd_account_token" "this" {
  renew_after = "168h"
}

resource "random_string" "this" {
  length  = 16
  special = false
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
    ARGO_TOKEN                = argocd_account_token.this.jwt
    ARGO_WATCHER_DEPLOY_TOKEN = random_string.this.result
  }
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/argo-watcher.tftpl", {
    domain         = var.domain
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [kubernetes_secret.this]
}
