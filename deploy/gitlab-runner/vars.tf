variable "gitlab_runner_token" {}
variable "chart_version" {}
variable "gitlab_url" {}
variable "namespace" {
  default = "gitlab-runners"
}
