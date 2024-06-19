# Debug Module

This module outputs some Debug information.

## Providers

The following providers are used by this module:

- <a name="provider_null"></a> [null](#provider_null) (3.2.2)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [null_resource.debug](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_module_folder"></a> [module_folder](#input_module_folder)

Description: Module is located in this folder

Type: `string`

Default: `"module_folder"`

### <a name="input_module_name"></a> [module_name](#input_module_name)

Description: The Module name

Type: `string`

Default: `"module_name"`

### <a name="input_module_written_for_cloud"></a> [module_written_for_cloud](#input_module_written_for_cloud)

Description: Module is written for the particular Cloud

Type: `string`

Default: `"module_written_for_cloud"`

## Outputs

The following outputs are exported:

### <a name="output_module_folder"></a> [module_folder](#output_module_folder)

Description: Module is located in this folder

### <a name="output_module_name"></a> [module_name](#output_module_name)

Description: The Module name

### <a name="output_module_written_for_cloud"></a> [module_written_for_cloud](#output_module_written_for_cloud)

Description: Module is written for the particular Cloud
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Debug Module

This module outputs some Debug information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.debug](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_module_folder"></a> [module\_folder](#input\_module\_folder) | Module is located in this folder | `string` | `"module_folder"` | no |
| <a name="input_module_name"></a> [module\_name](#input\_module\_name) | The Module name | `string` | `"module_name"` | no |
| <a name="input_module_written_for_cloud"></a> [module\_written\_for\_cloud](#input\_module\_written\_for\_cloud) | Module is written for the particular Cloud | `string` | `"module_written_for_cloud"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_folder"></a> [module\_folder](#output\_module\_folder) | Module is located in this folder |
| <a name="output_module_name"></a> [module\_name](#output\_module\_name) | The Module name |
| <a name="output_module_written_for_cloud"></a> [module\_written\_for\_cloud](#output\_module\_written\_for\_cloud) | Module is written for the particular Cloud |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
