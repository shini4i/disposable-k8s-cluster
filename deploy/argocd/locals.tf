locals {
  config = <<-EOT
    {
      "tlsClientConfig": {
        "insecure": false
      }
    }
  EOT
  cluster_labels = merge(
    { "argocd.argoproj.io/secret-type" = "cluster" },
    { cluster_name = "disposable" },
    var.argocd_applicationset_addons
  )
  cluster_annotations = merge(
    {
      common_repo_url      = var.gitops_common_repo
      common_repo_basepath = var.gitops_common_basepath
      common_repo_path     = var.gitops_common_path
      common_repo_revision = var.gitops_common_revision
    }
  )
  argocd = {
    apiVersion = "v1"
    kind       = "Secret"
    metadata = {
      name        = "in-cluster"
      namespace   = var.namespace
      labels      = local.cluster_labels
      annotations = local.cluster_annotations
    }
    stringData = {
      name   = "in-cluster"
      server = "https://kubernetes.default.svc"
      config = local.config
    }
  }
}
