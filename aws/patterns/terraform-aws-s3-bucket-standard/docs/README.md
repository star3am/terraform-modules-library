## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.49.0)

- <a name="provider_random"></a> [random](#provider_random) (3.6.1)

## Modules

The following Modules are called:

### <a name="module_logs_bucket"></a> [logs_bucket](#module_logs_bucket)

Source: github.com/star3am/terraform-modules-library//aws/modules/terraform-aws-s3-bucket

Version: main

### <a name="module_standard_bucket"></a> [standard_bucket](#module_standard_bucket)

Source: github.com/star3am/terraform-modules-library//aws/modules/terraform-aws-s3-bucket

Version: main

## Resources

The following resources are used by this module:

- [aws_kms_key.bucket_objects_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) (resource)
- [random_string.my_random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_logs_bucket"></a> [logs\_bucket](#module\_logs\_bucket) | github.com/star3am/terraform-modules-library//aws/modules/terraform-aws-s3-bucket | main |
| <a name="module_standard_bucket"></a> [standard\_bucket](#module\_standard\_bucket) | github.com/star3am/terraform-modules-library//aws/modules/terraform-aws-s3-bucket | main |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.bucket_objects_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [random_string.my_random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
