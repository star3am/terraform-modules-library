provider "aws" {
}

locals {
  bucket_name      = "transition-bucket-${random_string.this.id}"
  logs_bucket_name = "transition-bucket-logs-${random_string.this.id}"
}

data "aws_caller_identity" "current" {}

# data "aws_canonical_user_id" "current" {}

resource "random_string" "this" {
  length  = 5
  special = false
  upper   = false
}

resource "aws_kms_key" "bucket_objects_key" {
  #TODO: Need to bring in the upstream KMS module here as a source
  #checkov:skip=CKV2_AWS_64: Ensure KMS key Policy is defined
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}

#checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
module "logs_bucket" {
  #checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
  # tflint-ignore: terraform_module_pinned_source
  source = "github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-s3-bucket?ref=main"
  #checkov:skip=CKV_AWS_18: Ensure the S3 bucket has access logging enabled
  #checkov:skip=CKV2_AWS_61: Ensure that an S3 bucket has a lifecycle configuration
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  #tfsec:ignore:aws-s3-encryption-customer-key

  bucket = local.logs_bucket_name

  force_destroy = true

  control_object_ownership = true

  # object_ownership = "BucketOwnerPreferred"

  expected_bucket_owner = data.aws_caller_identity.current.account_id

  # attach_policy                         = true
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true
  attach_access_log_delivery_policy     = true

  access_log_delivery_policy_source_accounts = [data.aws_caller_identity.current.account_id]
  access_log_delivery_policy_source_buckets  = ["arn:aws:s3:::${local.bucket_name}"]

  allowed_kms_key_arn = aws_kms_key.bucket_objects_key.arn

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.bucket_objects_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

}

#checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
module "transition_bucket" {
  # tflint-ignore: terraform_module_pinned_source
  source = "github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-s3-bucket?ref=main"
  #checkov:skip=CKV_AWS_18: Ensure the S3 bucket has access logging enabled
  #checkov:skip=CKV2_AWS_61: Ensure that an S3 bucket has a lifecycle configuration
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  #tfsec:ignore:aws-s3-encryption-customer-key

  bucket = local.bucket_name

  force_destroy = true

  control_object_ownership = true

  # object_ownership = "BucketOwnerPreferred"

  expected_bucket_owner = data.aws_caller_identity.current.account_id

  # attach_policy                            = true
  attach_deny_insecure_transport_policy    = true
  attach_require_latest_tls_policy         = true
  attach_deny_incorrect_encryption_headers = true
  attach_deny_incorrect_kms_key_sse        = true
  attach_deny_unencrypted_object_uploads   = true

  allowed_kms_key_arn = aws_kms_key.bucket_objects_key.arn

  logging = {
    target_bucket = module.logs_bucket.s3_bucket_id
    target_prefix = "log/"
    target_object_key_format = {
      partitioned_prefix = {
        partition_date_source = "DeliveryTime" # "EventTime"
      }
      # simple_prefix = {}
    }
  }

  versioning = {
    status     = true
    mfa_delete = false
  }

  lifecycle_rule = [
    {
      id                                     = "object_lifecycle_1"
      enabled                                = true
      abort_incomplete_multipart_upload_days = 7

      noncurrent_version_transition = [
        {
          days          = 90
          storage_class = "STANDARD_IA"
        },
        {
          days          = 180
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 360
          storage_class = "GLACIER"
        },
      ]

      noncurrent_version_expiration = {
        days = 390
      }
    },
  ]

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.bucket_objects_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

}
