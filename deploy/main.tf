terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.13.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }

    github = {
      source  = "integrations/github"
      version = "6.11.1"
    }
  }
}

locals {
  local_setup = var.cloud_provider == "kind" ? true : false
}
