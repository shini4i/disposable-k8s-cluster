terraform {
  required_version = ">= 1.4"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }

    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}
