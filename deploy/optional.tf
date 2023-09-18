module "argo-watcher" {
  count = var.argo_watcher_enabled ? 1 : 0

  source        = "./argo-watcher"
  chart_version = var.argo_watcher_chart_version
  local_setup   = local.local_setup
  domain        = var.domain

  image_tag = var.argo_watcher_image_tag_override

  providers = {
    argocd = argocd
  }

  depends_on = [module.argo-cd]
}
