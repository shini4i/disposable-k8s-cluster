terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }

    argocd = {
      source  = "oboukili/argocd"
      version = "6.1.1"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
