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
    labels = {
      managed-by = "terraform"
    }
    annotations = {
      bootstrapped_by = "https://github.com/shini4i/disposable-k8s-cluster"
    }
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "kubernetes_secret" "this" {
  metadata {
    name      = "argo-watcher-secret"
    namespace = var.namespace
  }

  data = {
    ARGO_TOKEN                = argocd_account_token.this.jwt
    ARGO_WATCHER_DEPLOY_TOKEN = random_string.this.result
    sshPrivateKey             = tls_private_key.this.private_key_pem
  }

  depends_on = [tls_private_key.this]
}

resource "kubernetes_manifest" "postgres" {
  count = var.persistence_enabled ? 1 : 0

  manifest = yamldecode(templatefile("${path.module}/templates/argo-watcher-psql.tftpl", {
    namespace = kubernetes_namespace.this.metadata[0].name
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  depends_on = [kubernetes_namespace.this]
}

resource "kubernetes_manifest" "this" {
  manifest = yamldecode(templatefile("${path.module}/templates/argo-watcher.tftpl", {
    domain              = var.domain
    targetRevision      = var.chart_version
    local_setup         = var.local_setup
    imageTag            = var.image_tag
    persistence_enabled = var.persistence_enabled
    secretName          = kubernetes_secret.this.metadata[0].name
    namespace           = kubernetes_namespace.this.metadata[0].name
  }))

  wait {
    fields = {
      "status.sync.status"   = "Synced",
      "status.health.status" = "Healthy"
    }
  }

  field_manager {
    force_conflicts = true
  }

  depends_on = [
    kubernetes_secret.this,
    kubernetes_manifest.postgres
  ]
}
