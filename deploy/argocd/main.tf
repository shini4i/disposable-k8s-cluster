resource "kubernetes_namespace" "this" {
  metadata {
    name = "argo-cd"
  }
}

resource "helm_release" "this" {
  name      = "argo-cd"
  namespace = "argo-cd"

  version = var.chart_version

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  max_history = 1
  timeout     = 600

  values = [
    templatefile(
      "${path.module}/templates/argo-cd.tpl",
      {
        fqdn            = "argo-cd.${var.domain}"
        local_setup     = var.local_setup
      })
  ]

  depends_on = [
    kubernetes_namespace.this
  ]
}
