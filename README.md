<div align="center">

# disposable-k8s-cluster

This repository contains a set of scripts to create a disposable kubernetes cluster on one of supported cloud providers.

<img src="https://raw.githubusercontent.com/shini4i/assets/main/src/disposable-k8s-cluster/disposable.png" alt="Showcase" width="15%">

</div>

## General information

This project is intended to be used as a playground for testing and learning purposes. It is not intended to be used in production.

It was created in the way that should support extending it with new cloud providers and new applications.

Currently supported bootstrap options:
* [DigitalOcean](https://www.digitalocean.com/)
* [kind](https://kind.sigs.k8s.io/) - not a cloud provider, but a tool to create a kubernetes cluster on a local machine

Additionally, to simplify access to the cluster, we are deploying [external-dns](https://github.com/kubernetes-sigs/external-dns) and [cert-manager](https://cert-manager.io/) to the cluster. 

Those two controllers will be used to automatically create DNS records and TLS certificates for the ingress resources in the cluster.

### Default applications

The following applications (controllers) are deployed to the cluster by default:
* [ArgoCD](https://argoproj.github.io/argo-cd/) - a declarative, GitOps continuous delivery tool for Kubernetes
* [cert-manager](https://cert-manager.io/) - used to automatically create TLS certificates for the ingress resources
* [external-dns](https://github.com/kubernetes-sigs/external-dns) - used to automatically create DNS records for the ingress resources
* [traefik](https://traefik.io/) - used as an ingress controller

## Prerequisites

### Mandatory
* [terraform](https://www.terraform.io/) - used to create the cluster and deploy default applications
* [tfswitch](https://tfswitch.warrensbox.com/) - used to ensure that the correct version of terraform is used
* [GNU make](https://www.gnu.org/software/make/) - used to orchestrate the deployment
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - used to interact with the cluster

### Optional
* [direnv](https://direnv.net/) - used to automatically load environment variables from `.env` or `.envrc` files

## Usage

The following environment variables are required to be set:
* `TF_VAR_do_token` - DigitalOcean API token (required only when using DigitalOcean as a cloud provider)
* `TF_VAR_cloudflare_api_token` - Cloudflare API token (required for generating TLS certificates and DNS records)
* `KUBECONFIG` - path to the kubeconfig file (should be set to `./kubeconfig`)
* `DISPOSABLE_DOMAIN` - domain that will be used to create DNS records and TLS certificates

To create a cluster, run the following command:
```bash
make bootstrap
```
It will create a kind cluster and deploy default applications to it.

To bootstrap a DigitalOcean cluster, run the following command:
```bash
CLOUD_PROVIDER=digitalocean make bootstrap
```

To destroy the cluster, run the following command:
```bash
make destroy
```
