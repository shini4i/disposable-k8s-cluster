# cert-manager

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
| <a name="input_cert_manager_issuers_chart_version"></a> [cert\_manager\_issuers\_chart\_version](#input\_cert\_manager\_issuers\_chart\_version) | Version of the cert-manager-issuers chart to use | `string` | `"0.3.0"` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token for DNS validation | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_le_use_stage_issuer"></a> [le\_use\_stage\_issuer](#input\_le\_use\_stage\_issuer) | Use Let's Encrypt staging server | `bool` | `false` | no |
| <a name="input_raw_chart_version"></a> [raw\_chart\_version](#input\_raw\_chart\_version) | RAW chart version | `string` | `"2.0.2"` | no |
| <a name="input_wildcard_enabled"></a> [wildcard\_enabled](#input\_wildcard\_enabled) | Issue a wildcard certificate | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
