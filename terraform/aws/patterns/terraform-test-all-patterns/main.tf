# This is here to deploy all patterns together to TF Cloud Workspace

terraform {
  required_version = "~> 1.0"
}

module "aws_debug" {
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  #tflint-ignore: terraform_module_pinned_source
  source = "github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-debug?ref=main"

  # feature = false
}

# Disable Apply
# module "s3_bucket_standard" {
#   #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
#   #tflint-ignore: terraform_module_pinned_source
#   source = "github.com/star3am/terraform-modules-library//terraform/aws/patterns/s3-bucket-standard?ref=main"
# }

# module "s3_bucket_object_lock" {
#   #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
#   #tflint-ignore: terraform_module_pinned_source
#   source = "github.com/star3am/terraform-modules-library//terraform/aws/patterns/s3-bucket-object-lock?ref=main"
# }

# module "s3_bucket_glacier_transition" {
#   #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
#   #tflint-ignore: terraform_module_pinned_source
#   source = "github.com/star3am/terraform-modules-library//terraform/aws/patterns/s3-bucket-glacier-transition?ref=main"
# }

# module "rds_postgresql" {
#   #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
#   #tflint-ignore: terraform_module_pinned_source
#   source = "github.com/star3am/terraform-modules-library//terraform/aws/patterns/rds-postgresql?ref=main"
# }

# module "rds_mssql" {
#   #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
#   #tflint-ignore: terraform_module_pinned_source
#   source = "github.com/star3am/terraform-modules-library//terraform/aws/patterns/rds-mssql?ref=main"
# }
