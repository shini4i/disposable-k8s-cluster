# external-dns

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
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/3.2.1/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
