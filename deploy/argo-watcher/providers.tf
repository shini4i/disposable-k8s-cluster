terraform {
  required_version = ">= 1.9"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.2.1"
    }
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.16.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.3.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.13.0"
    }
  }
}
