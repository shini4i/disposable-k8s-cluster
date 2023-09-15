# deploy

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | 6.0.3 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.23.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argo-cd"></a> [argo-cd](#module\_argo-cd) | ./argocd | n/a |
| <a name="module_argo-watcher"></a> [argo-watcher](#module\_argo-watcher) | ./argo-watcher | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./cert-manager | n/a |
| <a name="module_external-dns"></a> [external-dns](#module\_external-dns) | ./external-dns | n/a |
| <a name="module_traefik"></a> [traefik](#module\_traefik) | ./ingress-controller | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_cd_chart_version"></a> [argo\_cd\_chart\_version](#input\_argo\_cd\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_argo_watcher_chart_version"></a> [argo\_watcher\_chart\_version](#input\_argo\_watcher\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_argo_watcher_enabled"></a> [argo\_watcher\_enabled](#input\_argo\_watcher\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_cert_manager_chart_version"></a> [cert\_manager\_chart\_version](#input\_cert\_manager\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | n/a | `any` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | n/a | `any` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `any` | n/a | yes |
| <a name="input_external_dns_chart_version"></a> [external\_dns\_chart\_version](#input\_external\_dns\_chart\_version) | n/a | `any` | n/a | yes |
| <a name="input_le_use_stage_issuer"></a> [le\_use\_stage\_issuer](#input\_le\_use\_stage\_issuer) | n/a | `bool` | n/a | yes |
| <a name="input_skip_expose"></a> [skip\_expose](#input\_skip\_expose) | n/a | `bool` | n/a | yes |
| <a name="input_traefik_chart_version"></a> [traefik\_chart\_version](#input\_traefik\_chart\_version) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_watcher_deploy_token"></a> [argo\_watcher\_deploy\_token](#output\_argo\_watcher\_deploy\_token) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
