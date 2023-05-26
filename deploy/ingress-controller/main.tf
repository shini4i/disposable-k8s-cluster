resource "kubernetes_namespace" "this" {
  metadata {
    name = "web"
  }
}

resource "helm_release" "this" {
  name      = "traefik"
  namespace = "web"

  version = var.chart_version

  repository = "https://traefik.github.io/charts"
  chart      = "traefik"

  max_history = 1
  timeout     = 600

  values = [
    templatefile(
      "${path.module}/templates/traefik.tpl",
      {
        local_setup          = var.local_setup
      })
  ]

  depends_on = [
    kubernetes_namespace.this
  ]
}
