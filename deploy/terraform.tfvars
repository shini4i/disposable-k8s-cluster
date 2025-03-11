argo_cd_chart_version      = "7.8.1"
use_custom_argocd_image    = true
custom_argocd_image        = "ghcr.io/shini4i/argocd"
custom_argocd_image_tag    = "v2.14.2"
argo_watcher_chart_version = "0.8.0"
cert_manager_chart_version = "1.17.1"
external_dns_chart_version = "8.7.5"
reflector_chart_version    = "9.0.313"
ingress_controller         = "traefik"
ingress_controller_chart_versions = {
  traefik       = "34.4.1"
  ingress-nginx = "4.12.0"
}

### ApplicationSet
application_set_enabled = false
gitops_common_repo      = "https://github.com/shini4i/gitops-playground.git"
gitops_common_revision  = "main"
gitops_common_basepath  = "common"
gitops_common_path      = "addons"
argocd_applicationset_addons = {
  enable_sealed_secrets = false
  enable_reflector      = false
  enable_argo_workflows = false
}

### Gitlab Runner
gitlab_runner_enabled       = false
gitlab_runner_chart_version = "0.71.0"
