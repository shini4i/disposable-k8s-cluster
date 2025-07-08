variable "gitlab_runner_token" {
  type        = string
  description = "runner-token (not runner-registration-token) for GitLab Runner"
  sensitive   = true
}
variable "chart_version" {
  type = string
}
variable "gitlab_url" {
  type = string
}
variable "namespace" {
  default = "gitlab-runners"
  type    = string
}
