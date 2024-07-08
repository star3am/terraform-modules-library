## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.57.0)

- <a name="provider_random"></a> [random](#provider_random) (3.6.2)

## Modules

The following Modules are called:

### <a name="module_logs_bucket"></a> [logs_bucket](#module_logs_bucket)

Source: github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-s3-bucket

Version: main

### <a name="module_standard_bucket"></a> [standard_bucket](#module_standard_bucket)

Source: github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-s3-bucket

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
