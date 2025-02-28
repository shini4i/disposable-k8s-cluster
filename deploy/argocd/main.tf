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
        fqdn                     = "argo-cd.${var.domain}"
        local_setup              = var.local_setup
        application_set_replicas = var.application_set_enabled ? 1 : 0
        use_custom_argocd_image  = var.use_custom_argocd_image
        custom_argocd_image      = var.custom_argocd_image
        custom_argocd_image_tag  = var.custom_argocd_image_tag
    })
  ]

  depends_on = [
    kubernetes_namespace.this
  ]
}

resource "kubernetes_secret_v1" "this" {
  metadata {
    name        = local.argocd.metadata.name
    namespace   = local.argocd.metadata.namespace
    labels      = local.argocd.metadata.labels
    annotations = local.argocd.metadata.annotations
  }
  data = local.argocd.stringData

  depends_on = [helm_release.this]
}

resource "kubernetes_manifest" "this" {
  count = var.application_set_enabled ? 1 : 0

  manifest = yamldecode(templatefile("${path.module}/templates/common-appset.tftpl", {
    namespace = var.namespace
    repoUrl   = var.gitops_common_repo
    revision  = var.gitops_common_revision
    basePath  = var.gitops_common_basepath
    path      = var.gitops_common_path
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [
    helm_release.this
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
