variable "do_token" {
  type      = string
  sensitive = true
}
variable "region" {
  type = string
}
variable "kubernetes_minor_version" {
  type = string
}
variable "kubernetes_cluster_name" {
  type = string
}
variable "node_type" {
  type = string
}
variable "node_count" {
  type = number
}
variable "vpc_cidr" {
  type = string
}
