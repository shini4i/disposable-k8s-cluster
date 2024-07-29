terraform {
  required_version = ">= 1.5"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }
  }
}

resource "kind_cluster" "disposable" {
  name           = "disposable-cluster"
  wait_for_ready = true

  node_image      = "kindest/node:${var.kind_version}"
  kubeconfig_path = "../../kubeconfig"

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      kubeadm_config_patches = [
        "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
      ]

      extra_port_mappings {
        container_port = 30080
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 30443
        host_port      = 443
      }
    }

    node {
      role = "worker"
    }
  }
}
