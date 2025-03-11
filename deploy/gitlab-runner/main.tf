resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "gitlab-token"
    namespace = var.namespace
  }

  data = {
    runner-registration-token = ""
    runner-token              = var.gitlab_runner_token
  }

  depends_on = [kubernetes_namespace.this]
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/gitlab-runner.tftpl", {
    targetRevision = var.chart_version
    namespace      = var.namespace
    gitlabUrl      = var.gitlab_url
    secretName     = kubernetes_secret.this.metadata.0.name
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [
    kubernetes_secret.this
  ]
}
