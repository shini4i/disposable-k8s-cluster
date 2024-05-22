terraform {
  required_version = ">= 1.4"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }

    argocd = {
      source  = "oboukili/argocd"
      version = "6.1.1"
    }
  }
}
