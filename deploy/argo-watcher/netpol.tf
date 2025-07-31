data "github_ip_ranges" "this" {}

resource "kubernetes_network_policy_v1" "allow_all_internal" {
  count = var.netpol_enabled ? 1 : 0

  metadata {
    name      = "allow-all-internal"
    namespace = var.namespace
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress", "Egress"]

    ingress {
      from {
        pod_selector {}
      }
    }

    egress {
      to {
        pod_selector {}
      }
    }
  }
}

resource "kubernetes_network_policy_v1" "allow_ingress_from_web" {
  count = var.netpol_enabled ? 1 : 0

  metadata {
    name      = "allow-ingress-from-web"
    namespace = var.namespace
  }

  spec {
    pod_selector {
      match_labels = {
        "app.kubernetes.io/name" = "argo-watcher"
      }
    }

    policy_types = ["Ingress"]

    ingress {
      from {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "web"
          }
        }
      }
      ports {
        port     = "8080"
        protocol = "TCP"
      }
    }
  }
}

resource "kubernetes_network_policy_v1" "argo_watcher_egress" {
  count = var.netpol_enabled ? 1 : 0

  metadata {
    name      = "argo-watcher-egress"
    namespace = var.namespace
  }

  spec {
    pod_selector {
      match_labels = {
        "app.kubernetes.io/name" = "argo-watcher"
      }
    }

    policy_types = ["Egress"]

    egress {
      to {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "argo-cd"
          }
        }
        pod_selector {
          match_labels = {
            "app.kubernetes.io/component" : "server"
            "app.kubernetes.io/instance" : "argo-cd"
          }
        }
      }
      ports {
        port     = "8080"
        protocol = "TCP"
      }
    }

    # allow both 22 and 443 access to github.com
    dynamic "egress" {
      for_each = data.github_ip_ranges.this.git
      content {
        to {
          ip_block {
            cidr = egress.value
          }
        }
        ports {
          port     = "22"
          protocol = "TCP"
        }
        ports {
          port     = "443"
          protocol = "TCP"
        }
      }
    }
  }
}

resource "kubernetes_network_policy_v1" "egress_dns" {
  count = var.netpol_enabled ? 1 : 0

  metadata {
    name      = "egress-to-dns"
    namespace = var.namespace
  }

  spec {
    pod_selector {}

    policy_types = ["Egress"]

    egress {
      to {
        namespace_selector {
          match_labels = {
            "kubernetes.io/metadata.name" = "kube-system"
          }
        }
        pod_selector {
          match_labels = {
            "k8s-app" : "kube-dns"
          }
        }
      }
      ports {
        port     = "53"
        protocol = "UDP"
      }
    }
  }
}
