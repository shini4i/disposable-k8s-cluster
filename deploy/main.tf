terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.16.1"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.0.3"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
