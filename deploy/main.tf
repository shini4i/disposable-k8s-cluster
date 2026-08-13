terraform {
  required_version = ">= 1.9"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.2.0"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.16.0"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
