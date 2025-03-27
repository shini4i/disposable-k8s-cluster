<div align="center">

# disposable-k8s-cluster

This repository contains a set of scripts to create a disposable kubernetes cluster on one of supported cloud providers.

<img src="https://raw.githubusercontent.com/shini4i/assets/main/src/disposable-k8s-cluster/disposable.png" alt="Showcase" width="15%">

</div>

## General information

This project is intended to be used as a playground for testing and learning purposes. It is not intended to be used in
production.

It was created in the way that should support extending it with new cloud providers and new applications.

Currently supported bootstrap options:

* [DigitalOcean](https://www.digitalocean.com/)
* [kind](https://kind.sigs.k8s.io/) - not a cloud provider, but a tool to create a kubernetes cluster on a local machine

Additionally, to simplify access to the cluster, we are
deploying [external-dns](https://github.com/kubernetes-sigs/external-dns) and [cert-manager](https://cert-manager.io/)
to the cluster.

Those two controllers will be used to automatically create DNS records and TLS certificates for the ingress resources in
the cluster.

### Default applications

The following applications (controllers) are deployed to the cluster by default:

* [ArgoCD](https://argoproj.github.io/argo-cd/) - a declarative, GitOps continuous delivery tool for Kubernetes
* [cert-manager](https://cert-manager.io/) - used to automatically create TLS certificates for the ingress resources
* [external-dns](https://github.com/kubernetes-sigs/external-dns) - used to automatically create DNS records for the
  ingress resources
* [traefik](https://traefik.io/) - used as an ingress controller (can be replaced by ingress-nginx)

### Optional applications

The following applications can be deployed by enabling them in the `deploy/terraform.tfvars`:

* [ingress-nginx](https://kubernetes.github.io/ingress-nginx/) - used as an alternative ingress controller
* [gitlab-runner](https://docs.gitlab.com/runner/) - used to run CI/CD pipelines in gitlab

## Prerequisites

### Mandatory

* [OpenTofu](https://opentofu.org/) - used to create the cluster and deploy default applications
* [tfswitch](https://tfswitch.warrensbox.com/) - used to ensure that the correct version of tofu is used
* [GNU make](https://www.gnu.org/software/make/) - used to orchestrate the deployment
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - used to interact with the cluster
* [jsonnet](https://jsonnet.org/) - used to generate project configuration

### Optional

* [direnv](https://direnv.net/) - used to automatically load environment variables from `.env` or `.envrc` files

## Configuration

To start using the project, create a `config/local.jsonnet` file with the necessary configuration. Example:

```jsonnet
{
  cloud_provider: "kind",
  domain: "example.com",
  cloudflare_api_token: "supersecuretoken",
  application_set_enabled: true,
  argocd_applicationset_addons: {
    enable_sealed_secrets: false,
    enable_reflector: true,
    enable_argo_workflows: false,
  },
}
```

Adjust according to the values you want to override. (check `config/default.json` for available settings)

<!-- BEGINNING OF PRE-COMMIT-MAKEFILE HOOK -->
## Usage

To set up a temporary kubernetes cluster, including infrastructure and common services run:

```bash
make bootstrap
```

To destroy ephemeral kubernetes cluster run:

```bash
make destroy
```

To stop kind cluster run:

```bash
make stop
```

To start kind cluster run:

```bash
make start
```

<!-- END OF PRE-COMMIT-MAKEFILE HOOK -->

## Contributing

Contributions are welcome! Feel free to submit a pull request. For major changes, please open an issue first to discuss.
