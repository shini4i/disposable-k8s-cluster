# deploy

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | 7.11.2 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 3.1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.38.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argo-cd"></a> [argo-cd](#module\_argo-cd) | ./argocd | n/a |
| <a name="module_argo-watcher"></a> [argo-watcher](#module\_argo-watcher) | ./argo-watcher | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./cert-manager | n/a |
| <a name="module_external-dns"></a> [external-dns](#module\_external-dns) | ./external-dns | n/a |
| <a name="module_gitlab-runner"></a> [gitlab-runner](#module\_gitlab-runner) | ./gitlab-runner | n/a |
| <a name="module_ingress-controller"></a> [ingress-controller](#module\_ingress-controller) | ./ingress-controller | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_set_enabled"></a> [application\_set\_enabled](#input\_application\_set\_enabled) | If ApplicationSet controller should be installed | `bool` | n/a | yes |
| <a name="input_argo_cd_chart_version"></a> [argo\_cd\_chart\_version](#input\_argo\_cd\_chart\_version) | Argo CD chart version | `string` | n/a | yes |
| <a name="input_argo_watcher_chart_version"></a> [argo\_watcher\_chart\_version](#input\_argo\_watcher\_chart\_version) | Argo Watcher chart version | `string` | n/a | yes |
| <a name="input_argo_watcher_enabled"></a> [argo\_watcher\_enabled](#input\_argo\_watcher\_enabled) | If Argo-Watcher should be installed | `bool` | n/a | yes |
| <a name="input_argo_watcher_image_tag_override"></a> [argo\_watcher\_image\_tag\_override](#input\_argo\_watcher\_image\_tag\_override) | Image override for Argo-Watcher | `string` | n/a | yes |
| <a name="input_argo_watcher_persistence_enabled"></a> [argo\_watcher\_persistence\_enabled](#input\_argo\_watcher\_persistence\_enabled) | If persistence should be enabled for Argo-Watcher | `bool` | n/a | yes |
| <a name="input_argocd_applicationset_addons"></a> [argocd\_applicationset\_addons](#input\_argocd\_applicationset\_addons) | ApplicationSet addons configuration | <pre>object({<br/>    enable_sealed_secrets = optional(bool, false)<br/>    enable_reflector      = optional(bool, false)<br/>    enable_argo_workflows = optional(bool, false)<br/>    enable_argo_rollouts  = optional(bool, false)<br/>  })</pre> | n/a | yes |
| <a name="input_cert_manager_chart_version"></a> [cert\_manager\_chart\_version](#input\_cert\_manager\_chart\_version) | Cert Manager chart version | `string` | n/a | yes |
| <a name="input_cert_manager_wildcard_enabled"></a> [cert\_manager\_wildcard\_enabled](#input\_cert\_manager\_wildcard\_enabled) | Issue a wildcard certificate | `bool` | `false` | no |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | Cloud provider to use | `string` | n/a | yes |
| <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token) | Cloudflare API token | `string` | `""` | no |
| <a name="input_custom_argocd_image"></a> [custom\_argocd\_image](#input\_custom\_argocd\_image) | Custom Argo CD image (for repoServer) | `string` | n/a | yes |
| <a name="input_custom_argocd_image_tag"></a> [custom\_argocd\_image\_tag](#input\_custom\_argocd\_image\_tag) | Custom Argo CD image tag (for repoServer) | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain to use for the cluster | `string` | n/a | yes |
| <a name="input_external_dns_chart_version"></a> [external\_dns\_chart\_version](#input\_external\_dns\_chart\_version) | External DNS chart version | `string` | n/a | yes |
| <a name="input_gitlab_runner_chart_version"></a> [gitlab\_runner\_chart\_version](#input\_gitlab\_runner\_chart\_version) | GitLab Runner chart version | `string` | n/a | yes |
| <a name="input_gitlab_runner_enabled"></a> [gitlab\_runner\_enabled](#input\_gitlab\_runner\_enabled) | If GitLab Runner should be installed | `bool` | n/a | yes |
| <a name="input_gitlab_runner_token"></a> [gitlab\_runner\_token](#input\_gitlab\_runner\_token) | GitLab Runner registration token | `string` | `""` | no |
| <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url) | Gitlab URL to use for GitLab Runner | `string` | `"https://gitlab.com/"` | no |
| <a name="input_gitops_common_basepath"></a> [gitops\_common\_basepath](#input\_gitops\_common\_basepath) | Git repository base path for common | `string` | n/a | yes |
| <a name="input_gitops_common_path"></a> [gitops\_common\_path](#input\_gitops\_common\_path) | Git repository path for common | `string` | n/a | yes |
| <a name="input_gitops_common_repo"></a> [gitops\_common\_repo](#input\_gitops\_common\_repo) | Git repository URL for common addons | `string` | n/a | yes |
| <a name="input_gitops_common_revision"></a> [gitops\_common\_revision](#input\_gitops\_common\_revision) | Git repository revision/branch/ref for common | `string` | n/a | yes |
| <a name="input_ingress_controller"></a> [ingress\_controller](#input\_ingress\_controller) | Ingress controller to use | `string` | n/a | yes |
| <a name="input_ingress_controller_chart_versions"></a> [ingress\_controller\_chart\_versions](#input\_ingress\_controller\_chart\_versions) | A list of ingress controller chart versions | `map(string)` | n/a | yes |
| <a name="input_le_use_stage_issuer"></a> [le\_use\_stage\_issuer](#input\_le\_use\_stage\_issuer) | Use the Let's Encrypt staging issuer | `bool` | n/a | yes |
| <a name="input_netpol_enabled"></a> [netpol\_enabled](#input\_netpol\_enabled) | If network policies should be enabled | `bool` | `false` | no |
| <a name="input_skip_expose"></a> [skip\_expose](#input\_skip\_expose) | If cert-manager and external-dns installation should be skipped | `bool` | n/a | yes |
| <a name="input_use_custom_argocd_image"></a> [use\_custom\_argocd\_image](#input\_use\_custom\_argocd\_image) | If custom Argo CD image should be used (for repoServer) | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_cd_password"></a> [argo\_cd\_password](#output\_argo\_cd\_password) | The password of the Argo CD admin user |
| <a name="output_argo_cd_url"></a> [argo\_cd\_url](#output\_argo\_cd\_url) | The URL of the Argo CD instance |
| <a name="output_argo_cd_username"></a> [argo\_cd\_username](#output\_argo\_cd\_username) | The username of the Argo CD admin user |
| <a name="output_argo_watcher_deploy_token"></a> [argo\_watcher\_deploy\_token](#output\_argo\_watcher\_deploy\_token) | The deploy token used to validate tasks for the Argo Watcher |
| <a name="output_argo_watcher_ssh_public_key"></a> [argo\_watcher\_ssh\_public\_key](#output\_argo\_watcher\_ssh\_public\_key) | The SSH public key used by the Argo Watcher to commit changes to the gitops repository |
<!-- END_TF_DOCS -->
