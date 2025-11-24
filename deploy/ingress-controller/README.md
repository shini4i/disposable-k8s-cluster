# ingress-controller

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/2.38.0/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ingress_controller"></a> [ingress\_controller](#input\_ingress\_controller) | which ingress controller to use | `string` | `"traefik"` | no |
| <a name="input_ingress_controller_chart_versions"></a> [ingress\_controller\_chart\_versions](#input\_ingress\_controller\_chart\_versions) | A list of ingress controller chart versions | `map(string)` | n/a | yes |
| <a name="input_ingress_controller_templates"></a> [ingress\_controller\_templates](#input\_ingress\_controller\_templates) | n/a | `map(string)` | <pre>{<br/>  "ingress-nginx": "ingress-nginx.tftpl",<br/>  "traefik": "traefik.tftpl"<br/>}</pre> | no |
| <a name="input_local_setup"></a> [local\_setup](#input\_local\_setup) | n/a | `bool` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
