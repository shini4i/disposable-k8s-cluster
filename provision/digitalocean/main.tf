terraform {
  required_version = ">= 1.8"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.50.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}
