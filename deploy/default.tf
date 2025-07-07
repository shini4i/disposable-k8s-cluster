module "argo-cd" {
  source                  = "./argocd"
  chart_version           = var.argo_cd_chart_version
  domain                  = var.domain
  local_setup             = local.local_setup
  application_set_enabled = var.application_set_enabled
  use_custom_argocd_image = var.use_custom_argocd_image
  custom_argocd_image     = var.custom_argocd_image
  custom_argocd_image_tag = var.custom_argocd_image_tag

  gitops_common_repo           = var.gitops_common_repo
  gitops_common_revision       = var.gitops_common_revision
  gitops_common_basepath       = var.gitops_common_basepath
  gitops_common_path           = var.gitops_common_path
  argocd_applicationset_addons = var.argocd_applicationset_addons

  use_wildcard_certificate = var.cert_manager_wildcard_enabled
}

module "ingress-controller" {
  source                            = "./ingress-controller"
  ingress_controller                = var.ingress_controller
  ingress_controller_chart_versions = var.ingress_controller_chart_versions
  local_setup                       = local.local_setup

  depends_on = [module.argo-cd]
}
