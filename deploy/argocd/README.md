# argocd

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.33.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.33.0/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.33.0/docs/resources/secret_v1) | resource |
| [kubernetes_secret.admin_password](https://registry.terraform.io/providers/hashicorp/kubernetes/2.33.0/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_set_enabled"></a> [application\_set\_enabled](#input\_application\_set\_enabled) | If ApplicationSet controller should be installed | `bool` | n/a | yes |
| <a name="input_argocd_applicationset_addons"></a> [argocd\_applicationset\_addons](#input\_argocd\_applicationset\_addons) | Kubernetes addons | `any` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_custom_argocd_image"></a> [custom\_argocd\_image](#input\_custom\_argocd\_image) | n/a | `string` | n/a | yes |
| <a name="input_custom_argocd_image_tag"></a> [custom\_argocd\_image\_tag](#input\_custom\_argocd\_image\_tag) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_gitops_common_basepath"></a> [gitops\_common\_basepath](#input\_gitops\_common\_basepath) | Git repository base path for common | `string` | n/a | yes |
| <a name="input_gitops_common_path"></a> [gitops\_common\_path](#input\_gitops\_common\_path) | Git repository path for common | `string` | n/a | yes |
| <a name="input_gitops_common_repo"></a> [gitops\_common\_repo](#input\_gitops\_common\_repo) | Git repository contains for common | `string` | n/a | yes |
| <a name="input_gitops_common_revision"></a> [gitops\_common\_revision](#input\_gitops\_common\_revision) | Git repository revision/branch/ref for common | `string` | n/a | yes |
| <a name="input_local_setup"></a> [local\_setup](#input\_local\_setup) | n/a | `bool` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | `"argo-cd"` | no |
| <a name="input_use_custom_argocd_image"></a> [use\_custom\_argocd\_image](#input\_use\_custom\_argocd\_image) | n/a | `bool` | `false` | no |
| <a name="input_use_wildcard_certificate"></a> [use\_wildcard\_certificate](#input\_use\_wildcard\_certificate) | Whether to use a wildcard certificate for the ingress | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | n/a |
<!-- END_TF_DOCS -->
