terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.1.0"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.11.2"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
