terraform {
  required_version = ">= 1.4"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }

    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

provider "kubernetes" {
  config_path = "../kubeconfig"
}

provider "helm" {
  kubernetes {
    config_path = "../kubeconfig"
  }
}

provider "kubectl" {
  config_path = "../kubeconfig"
}

provider "argocd" {
  port_forward_with_namespace = "argo-cd"
  plain_text                  = true

  username = "admin"
  password = module.argo-cd.admin_password
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
