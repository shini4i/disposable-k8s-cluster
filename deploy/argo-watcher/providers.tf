terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.11.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
    github = {
      source  = "integrations/github"
      version = "6.8.3"
    }
  }
}
