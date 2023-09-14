data "digitalocean_kubernetes_versions" "disposable" {
  version_prefix = "${var.kubernetes_minor_version}."
}

resource "digitalocean_kubernetes_cluster" "disposable" {
  name    = var.kubernetes_cluster_name
  region  = var.region
  version = data.digitalocean_kubernetes_versions.disposable.latest_version

  surge_upgrade = true
  auto_upgrade  = true

  node_pool {
    name       = "${var.kubernetes_cluster_name}-default-pool"
    size       = var.node_type
    node_count = var.node_count
  }
}

resource "local_file" "kubeconfig" {
  filename = "../../kubeconfig"
  content  = digitalocean_kubernetes_cluster.disposable.kube_config.0.raw_config
}
