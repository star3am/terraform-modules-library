## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.49.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_s3_directory_bucket.single_az_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_directory_bucket) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_s3_availability_zone"></a> [s3_availability_zone](#input_s3_availability_zone)

Description: AWS Availability Zone Identifier

Type: `string`

Default: `"apse2-az1"`

## Outputs

No outputs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_directory_bucket.single_az_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_directory_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_s3_availability_zone"></a> [s3\_availability\_zone](#input\_s3\_availability\_zone) | AWS Availability Zone Identifier | `string` | `"apse2-az1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
