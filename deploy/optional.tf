module "cert-manager" {
  count                = var.skip_expose ? 0 : 1
  source               = "./cert-manager"
  chart_version        = var.cert_manager_chart_version
  cloudflare_api_token = var.cloudflare_api_token
  domain               = var.domain
  le_use_stage_issuer  = var.le_use_stage_issuer

  depends_on = [module.argo-cd]
}

module "external-dns" {
  count                = var.skip_expose ? 0 : 1
  source               = "./external-dns"
  chart_version        = var.external_dns_chart_version
  cloudflare_api_token = var.cloudflare_api_token
  domain               = var.domain

  depends_on = [module.argo-cd]
}

module "argo-watcher" {
  count = var.argo_watcher_enabled ? 1 : 0

  source              = "./argo-watcher"
  chart_version       = var.argo_watcher_chart_version
  local_setup         = local.local_setup
  domain              = var.domain
  persistence_enabled = var.argo_watcher_persistence_enabled

  image_tag = var.argo_watcher_image_tag_override

  providers = {
    argocd = argocd
  }

  depends_on = [module.argo-cd]
}

module "gitlab-runner" {
  count = var.gitlab_runner_enabled ? 1 : 0

  source              = "./gitlab-runner"
  chart_version       = var.gitlab_runner_chart_version
  gitlab_url          = var.gitlab_url
  gitlab_runner_token = var.gitlab_runner_token

  depends_on = [module.argo-cd]
}
