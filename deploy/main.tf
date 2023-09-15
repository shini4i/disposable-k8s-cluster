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

    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
