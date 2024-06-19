# Resource Group Module

This module creates an empty Resource Group.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) (3.103.1)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_resource_group.module](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [azurerm_subscription.module](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input_location)

Description: (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

Type: `string`

Default: `"Australia East"`

### <a name="input_module_name"></a> [module_name](#input_module_name)

Description: The Module name

Type: `string`

Default: `"module_name"`

### <a name="input_tags"></a> [tags](#input_tags)

Description: Set of base tags that will be associated with each supported resource.

Type: `map(any)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output_id)

Description: The ID of the Resource Group
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Resource Group Module

This module creates an empty Resource Group.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.108.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.module](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.module](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `"Australia East"` | no |
| <a name="input_module_name"></a> [module\_name](#input\_module\_name) | The Module name | `string` | `"module_name"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Set of base tags that will be associated with each supported resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Resource Group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
