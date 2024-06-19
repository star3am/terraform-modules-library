# wrappers

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_wrapper"></a> [wrapper](#module\_wrapper) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_defaults"></a> [defaults](#input\_defaults) | Map of default values which will be used for each item. | `any` | `{}` | no |
| <a name="input_items"></a> [items](#input\_items) | Maps of items to create a wrapper from. Values are passed through to the module. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wrapper"></a> [wrapper](#output\_wrapper) | Map of outputs of a wrapper. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
