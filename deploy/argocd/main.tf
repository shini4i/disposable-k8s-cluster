resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "this" {
  name      = "argo-cd"
  namespace = var.namespace

  version = var.chart_version

  repository = "oci://ghcr.io/argoproj/argo-helm"
  chart      = "argo-cd"

  max_history = 1
  timeout     = 600

  values = [
    templatefile(
      "${path.module}/templates/argo-cd.tftpl",
      {
        fqdn                    = "argo-cd.${var.domain}"
        local_setup             = var.local_setup
        application_set_enabled = var.application_set_enabled
    })
  ]

  depends_on = [
    kubernetes_namespace.this
  ]
}

data "kubernetes_secret" "admin_password" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = var.namespace
  }

  depends_on = [
    helm_release.this
  ]
}
