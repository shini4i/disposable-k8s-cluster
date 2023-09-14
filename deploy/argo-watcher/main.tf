locals {
  argo_watcher = templatefile("${path.module}/templates/argo-watcher.tftpl", {
    domain         = var.domain
    targetRevision = var.chart_version
    local_setup    = var.local_setup
  })
}

data "external" "this" {
  program = ["bash", "${path.module}/scripts/token_generator.sh"]
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
    ARGO_TOKEN = data.external.this.result["ARGO_TOKEN"]
  }
}

resource "kubectl_manifest" "argo-watcher" {
  yaml_body  = local.argo_watcher
  wait       = true
  depends_on = [kubernetes_secret.this]
}