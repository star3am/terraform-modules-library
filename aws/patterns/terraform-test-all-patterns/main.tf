# This is here to deploy all patterns together to TF Cloud Workspace

terraform {
  required_version = "~> 1.0"
}

module "s3_bucket_standard" {
  source = "github.com/star3am/terraform-modules-library//aws/patterns/s3-bucket-standard?ref=main"
}

module "s3_bucket_object_lock" {
  source = "github.com/star3am/terraform-modules-library//aws/patterns/s3-bucket-object-lock?ref=main"
}

module "s3_bucket_glacier_transition" {
  source = "github.com/star3am/terraform-modules-library//aws/patterns/s3-bucket-glacier-transition?ref=main"
}

module "rds_postgresql" {
  source = "github.com/star3am/terraform-modules-library//aws/patterns/rds-postgresql?ref=main"
}

module "rds_mssql" {
  source = "github.com/star3am/terraform-modules-library//aws/patterns/rds-mssql?ref=main"
}
