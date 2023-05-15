module "argo-cd" {
  source = "./argocd"

  chart_version = var.argo_cd_chart_version

  argo_cd_version = var.argo_cd_version
  domain          = var.domain
}

module "cert-manager" {
  source = "./cert_manager"

  chart_version = var.cert_manager_chart_version

  cloudflare_api_token = var.cloudflare_api_token
  domain               = var.domain
  le_use_stage_issuer  = var.le_use_stage_issuer
}

#module "external-dns" {
#  source = "./external_dns"
#
#  chart_version = var.external_dns_chart_version
#
#  cloudflare_api_token = var.cloudflare_api_token
#  domain               = var.domain
#}

module "traefik" {
  source = "./ingress-controller"

  chart_version = var.traefik_chart_version
  local_setup   = local.local_setup
}
