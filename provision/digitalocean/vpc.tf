resource "digitalocean_vpc" "this" {
  name     = "${var.kubernetes_cluster_name}-network"
  region   = var.region
  ip_range = var.vpc_cidr
}
