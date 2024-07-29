# digitalocean

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.28.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.28.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.disposable](https://registry.terraform.io/providers/digitalocean/digitalocean/2.28.1/docs/resources/kubernetes_cluster) | resource |
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [digitalocean_kubernetes_versions.disposable](https://registry.terraform.io/providers/digitalocean/digitalocean/2.28.1/docs/data-sources/kubernetes_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#input\_kubernetes\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_kubernetes_minor_version"></a> [kubernetes\_minor\_version](#input\_kubernetes\_minor\_version) | n/a | `any` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `any` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
