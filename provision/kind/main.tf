terraform {
  required_version = ">= 1.4"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.0.17"
    }
  }
}

resource "kind_cluster" "disposable" {
  name = "disposable-cluster"
  wait_for_ready = true

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

# https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

#kubectl wait --namespace ingress-nginx \
#--for=condition=ready pod \
#--selector=app.kubernetes.io/component=controller \
#--timeout=90s