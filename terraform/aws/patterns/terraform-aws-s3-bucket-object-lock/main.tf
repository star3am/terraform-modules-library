provider "aws" {
}

locals {
  bucket_name      = "obj-lock-bucket-${random_string.this.id}"
  logs_bucket_name = "obj-lock-bucket-logs-${random_string.this.id}"
}

data "aws_caller_identity" "current" {}

# data "aws_canonical_user_id" "current" {}

resource "random_string" "this" {
  length  = 5
  special = false
  upper   = false
}

resource "aws_kms_key" "bucket_objects_key" {
  #checkov:skip=CKV2_AWS_64: Ensure KMS key Policy is defined
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 30
  enable_key_rotation     = true
}

#There seems to be an issue with applying localised policies so leaving
# to the upstream module
#data "aws_iam_policy_document" "obj_lock_bucket_policy" {
#}

#data "aws_iam_policy_document" "logs_bucket_policy" {
#}

#checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
module "logs_bucket" {
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

module "object_lock_bucket" {
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

  lifecycle_rule = []

  object_lock_enabled = true
  object_lock_configuration = {
    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 30
      }
    }
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.bucket_objects_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

}
