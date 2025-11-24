provider "kubernetes" {
  config_path = "../kubeconfig"
}

provider "helm" {
  kubernetes = {
    config_path = "../kubeconfig"
  }
}

provider "argocd" {
  port_forward_with_namespace = "argo-cd"
  plain_text                  = true

  username = "admin"
  password = module.argo-cd.admin_password
}
