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

  set {
    name  = "providers.kubernetesCRD.allowCrossNamespace"
    value = "true"
  }

  set {
    name  = "providers.kubernetesIngress.publishedService.enabled"
    value = "true"
  }

  set {
    name  = "ports.web.redirectTo"
    value = "websecure"
  }

  depends_on = [
    kubernetes_namespace.this
  ]
}
