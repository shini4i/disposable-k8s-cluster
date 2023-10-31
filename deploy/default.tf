module "argo-cd" {
  source                  = "./argocd"
  chart_version           = var.argo_cd_chart_version
  domain                  = var.domain
  local_setup             = local.local_setup
  application_set_enabled = var.application_set_enabled
}

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

module "traefik" {
  source        = "./ingress-controller"
  chart_version = var.traefik_chart_version
  local_setup   = local.local_setup

  depends_on = [module.argo-cd]
}
