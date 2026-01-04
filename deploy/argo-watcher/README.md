# argo-watcher

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | 7.11.2 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.8.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.38.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.7.2 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | 7.11.2 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.8.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.38.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [argocd_account_token.this](https://registry.terraform.io/providers/argoproj-labs/argocd/7.11.2/docs/resources/account_token) | resource |
| [kubernetes_manifest.postgres](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/namespace) | resource |
| [kubernetes_network_policy_v1.allow_all_internal](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/network_policy_v1) | resource |
| [kubernetes_network_policy_v1.allow_ingress_from_web](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/network_policy_v1) | resource |
| [kubernetes_network_policy_v1.argo_watcher_egress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/network_policy_v1) | resource |
| [kubernetes_network_policy_v1.egress_dns](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/network_policy_v1) | resource |
| [kubernetes_secret.postgres_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/secret) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/secret) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/3.7.2/docs/resources/string) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/4.1.0/docs/resources/private_key) | resource |
| [github_ip_ranges.this](https://registry.terraform.io/providers/integrations/github/6.8.3/docs/data-sources/ip_ranges) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | The version of the chart to deploy | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain to use for the ingress | `string` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The image tag to use for the deployment | `string` | n/a | yes |
| <a name="input_local_setup"></a> [local\_setup](#input\_local\_setup) | Whether the setup is KIND based or not | `bool` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to deploy the chart into | `string` | `"argo-watcher"` | no |
| <a name="input_netpol_enabled"></a> [netpol\_enabled](#input\_netpol\_enabled) | Whether to enable the network policies or not | `bool` | `false` | no |
| <a name="input_persistence_enabled"></a> [persistence\_enabled](#input\_persistence\_enabled) | Whether to enable persistence or not | `bool` | n/a | yes |
| <a name="input_use_wildcard_certificate"></a> [use\_wildcard\_certificate](#input\_use\_wildcard\_certificate) | Whether to use a wildcard certificate for the ingress | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_watcher_deploy_token"></a> [argo\_watcher\_deploy\_token](#output\_argo\_watcher\_deploy\_token) | Argo Watcher deploy token |
| <a name="output_ssh_public_key"></a> [ssh\_public\_key](#output\_ssh\_public\_key) | The SSH public key used by the Argo Watcher to commit changes to the gitops repository |
<!-- END_TF_DOCS -->
