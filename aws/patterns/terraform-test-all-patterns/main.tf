# This is here to deploy all patterns together to TF Cloud Workspace

terraform {
  required_version = "~> 1.0"
}

module "s3_bucket_standard" {
  source = "../s3-bucket-standard"
}

module "s3_bucket_object_lock" {
  source = "../s3-bucket-object-lock"
}

module "s3_bucket_glacier_transition" {
  source = "../s3-bucket-glacier-transition"
}

module "rds_postgresql" {
  source = "../rds-postgresql"
}

module "rds_mssql" {
  source = "../rds-mssql"
}
