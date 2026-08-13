<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 3.2.1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 3.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/3.2.1/docs/resources/manifest) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/3.2.1/docs/resources/namespace) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/3.2.1/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_gitlab_runner_token"></a> [gitlab\_runner\_token](#input\_gitlab\_runner\_token) | runner-token (not runner-registration-token) for GitLab Runner | `string` | n/a | yes |
| <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"gitlab-runners"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
