terraform {
  required_version = ">= 1.8"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.0"
    }

    argocd = {
      source  = "argoproj-labs/argocd"
      version = "~> 7.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
