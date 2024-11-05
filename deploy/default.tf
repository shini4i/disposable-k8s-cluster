module "argo-cd" {
  source                  = "./argocd"
  chart_version           = var.argo_cd_chart_version
  domain                  = var.domain
  local_setup             = local.local_setup
  application_set_enabled = var.application_set_enabled
  use_custom_argocd_image = var.use_custom_argocd_image
  custom_argocd_image     = var.custom_argocd_image
  custom_argocd_image_tag = var.custom_argocd_image_tag
}

module "traefik" {
  source        = "./ingress-controller"
  chart_version = var.traefik_chart_version
  local_setup   = local.local_setup

  depends_on = [module.argo-cd]
}

module "reflector" {
  source        = "./reflector"
  chart_version = var.reflector_chart_version

  depends_on = [module.argo-cd]
}
