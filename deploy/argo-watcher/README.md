# argo-watcher

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | 6.0.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | 6.0.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [argocd_account_token.this](https://registry.terraform.io/providers/oboukili/argocd/6.0.3/docs/resources/account_token) | resource |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/namespace) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/secret) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the chart to deploy | `any` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain to use for the ingress | `any` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The image tag to use for the deployment | `string` | `"v0.6.0-pre.20230914"` | no |
| <a name="input_local_setup"></a> [local\_setup](#input\_local\_setup) | Whether the setup is KIND based or not | `bool` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to deploy the chart into | `string` | `"argo-watcher"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_watcher_deploy_token"></a> [argo\_watcher\_deploy\_token](#output\_argo\_watcher\_deploy\_token) | Argo Watcher deploy token |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
