terraform {
  required_version = ">= 1.4"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubernetes" {
  config_path = "../kubeconfig"
}

provider "helm" {
  kubernetes {
    config_path = "../kubeconfig"
  }
}

provider "kubectl" {
  config_path = "../kubeconfig"
}
