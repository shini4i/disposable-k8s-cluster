terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.0.3"
    }
  }
}
