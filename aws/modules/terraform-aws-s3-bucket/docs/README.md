## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.57.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)
- [aws_s3_bucket_accelerate_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) (resource)
- [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) (resource)
- [aws_s3_bucket_analytics_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_analytics_configuration) (resource)
- [aws_s3_bucket_cors_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) (resource)
- [aws_s3_bucket_intelligent_tiering_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) (resource)
- [aws_s3_bucket_inventory.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_inventory) (resource)
- [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) (resource)
- [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) (resource)
- [aws_s3_bucket_metric.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_metric) (resource)
- [aws_s3_bucket_object_lock_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration) (resource)
- [aws_s3_bucket_ownership_controls.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) (resource)
- [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) (resource)
- [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) (resource)
- [aws_s3_bucket_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) (resource)
- [aws_s3_bucket_request_payment_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration) (resource)
- [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) (resource)
- [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) (resource)
- [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_canonical_user_id.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) (data source)
- [aws_iam_policy_document.access_log_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.deny_incorrect_encryption_headers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.deny_incorrect_kms_key_sse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.deny_insecure_transport](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.deny_unencrypted_object_uploads](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.elb_log_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.inventory_and_analytics_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.lb_log_delivery](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_iam_policy_document.require_latest_tls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) (data source)
- [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_acceleration_status"></a> [acceleration_status](#input_acceleration_status)

Description: (Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended.

Type: `string`

Default: `null`

### <a name="input_access_log_delivery_policy_source_accounts"></a> [access_log_delivery_policy_source_accounts](#input_access_log_delivery_policy_source_accounts)

Description: (Optional) List of AWS Account IDs should be allowed to deliver access logs to this bucket.

Type: `list(string)`

Default: `[]`

### <a name="input_access_log_delivery_policy_source_buckets"></a> [access_log_delivery_policy_source_buckets](#input_access_log_delivery_policy_source_buckets)

Description: (Optional) List of S3 bucket ARNs wich should be allowed to deliver access logs to this bucket.

Type: `list(string)`

Default: `[]`

### <a name="input_acl"></a> [acl](#input_acl)

Description: (Optional) The canned ACL to apply. Conflicts with `grant`

Type: `string`

Default: `null`

### <a name="input_allowed_kms_key_arn"></a> [allowed_kms_key_arn](#input_allowed_kms_key_arn)

Description: The ARN of KMS key which should be allowed in PutObject

Type: `string`

Default: `null`

### <a name="input_analytics_configuration"></a> [analytics_configuration](#input_analytics_configuration)

Description: Map containing bucket analytics configuration.

Type: `any`

Default: `{}`

### <a name="input_analytics_self_source_destination"></a> [analytics_self_source_destination](#input_analytics_self_source_destination)

Description: Whether or not the analytics source bucket is also the destination bucket.

Type: `bool`

Default: `false`

### <a name="input_analytics_source_account_id"></a> [analytics_source_account_id](#input_analytics_source_account_id)

Description: The analytics source account id.

Type: `string`

Default: `null`

### <a name="input_analytics_source_bucket_arn"></a> [analytics_source_bucket_arn](#input_analytics_source_bucket_arn)

Description: The analytics source bucket ARN.

Type: `string`

Default: `null`

### <a name="input_attach_access_log_delivery_policy"></a> [attach_access_log_delivery_policy](#input_attach_access_log_delivery_policy)

Description: Controls if S3 bucket should have S3 access log delivery policy attached

Type: `bool`

Default: `false`

### <a name="input_attach_analytics_destination_policy"></a> [attach_analytics_destination_policy](#input_attach_analytics_destination_policy)

Description: Controls if S3 bucket should have bucket analytics destination policy attached.

Type: `bool`

Default: `false`

### <a name="input_attach_deny_incorrect_encryption_headers"></a> [attach_deny_incorrect_encryption_headers](#input_attach_deny_incorrect_encryption_headers)

Description: Controls if S3 bucket should deny incorrect encryption headers policy attached.

Type: `bool`

Default: `false`

### <a name="input_attach_deny_incorrect_kms_key_sse"></a> [attach_deny_incorrect_kms_key_sse](#input_attach_deny_incorrect_kms_key_sse)

Description: Controls if S3 bucket policy should deny usage of incorrect KMS key SSE.

Type: `bool`

Default: `false`

### <a name="input_attach_deny_insecure_transport_policy"></a> [attach_deny_insecure_transport_policy](#input_attach_deny_insecure_transport_policy)

Description: Controls if S3 bucket should have deny non-SSL transport policy attached

Type: `bool`

Default: `false`

### <a name="input_attach_deny_unencrypted_object_uploads"></a> [attach_deny_unencrypted_object_uploads](#input_attach_deny_unencrypted_object_uploads)

Description: Controls if S3 bucket should deny unencrypted object uploads policy attached.

Type: `bool`

Default: `false`

### <a name="input_attach_elb_log_delivery_policy"></a> [attach_elb_log_delivery_policy](#input_attach_elb_log_delivery_policy)

Description: Controls if S3 bucket should have ELB log delivery policy attached

Type: `bool`

Default: `false`

### <a name="input_attach_inventory_destination_policy"></a> [attach_inventory_destination_policy](#input_attach_inventory_destination_policy)

Description: Controls if S3 bucket should have bucket inventory destination policy attached.

Type: `bool`

Default: `false`

### <a name="input_attach_lb_log_delivery_policy"></a> [attach_lb_log_delivery_policy](#input_attach_lb_log_delivery_policy)

Description: Controls if S3 bucket should have ALB/NLB log delivery policy attached

Type: `bool`

Default: `false`

### <a name="input_attach_policy"></a> [attach_policy](#input_attach_policy)

Description: Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy)

Type: `bool`

Default: `false`

### <a name="input_attach_public_policy"></a> [attach_public_policy](#input_attach_public_policy)

Description: Controls if a user defined public bucket policy will be attached (set to `false` to allow upstream to apply defaults to the bucket)

Type: `bool`

Default: `true`

### <a name="input_attach_require_latest_tls_policy"></a> [attach_require_latest_tls_policy](#input_attach_require_latest_tls_policy)

Description: Controls if S3 bucket should require the latest version of TLS

Type: `bool`

Default: `false`

### <a name="input_block_public_acls"></a> [block_public_acls](#input_block_public_acls)

Description: Whether Amazon S3 should block public ACLs for this bucket.

Type: `bool`

Default: `true`

### <a name="input_block_public_policy"></a> [block_public_policy](#input_block_public_policy)

Description: Whether Amazon S3 should block public bucket policies for this bucket.

Type: `bool`

Default: `true`

### <a name="input_bucket"></a> [bucket](#input_bucket)

Description: (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.

Type: `string`

Default: `null`

### <a name="input_bucket_prefix"></a> [bucket_prefix](#input_bucket_prefix)

Description: (Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket.

Type: `string`

Default: `null`

### <a name="input_control_object_ownership"></a> [control_object_ownership](#input_control_object_ownership)

Description: Whether to manage S3 Bucket Ownership Controls on this bucket.

Type: `bool`

Default: `true`

### <a name="input_cors_rule"></a> [cors_rule](#input_cors_rule)

Description: List of maps containing rules for Cross-Origin Resource Sharing.

Type: `any`

Default: `[]`

### <a name="input_create_bucket"></a> [create_bucket](#input_create_bucket)

Description: Controls if S3 bucket should be created

Type: `bool`

Default: `true`

### <a name="input_expected_bucket_owner"></a> [expected_bucket_owner](#input_expected_bucket_owner)

Description: The account ID of the expected bucket owner

Type: `string`

Default: `null`

### <a name="input_force_destroy"></a> [force_destroy](#input_force_destroy)

Description: (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable.

Type: `bool`

Default: `false`

### <a name="input_grant"></a> [grant](#input_grant)

Description: An ACL policy grant. Conflicts with `acl`

Type: `any`

Default: `[]`

### <a name="input_ignore_public_acls"></a> [ignore_public_acls](#input_ignore_public_acls)

Description: Whether Amazon S3 should ignore public ACLs for this bucket.

Type: `bool`

Default: `true`

### <a name="input_intelligent_tiering"></a> [intelligent_tiering](#input_intelligent_tiering)

Description: Map containing intelligent tiering configuration.

Type: `any`

Default: `{}`

### <a name="input_inventory_configuration"></a> [inventory_configuration](#input_inventory_configuration)

Description: Map containing S3 inventory configuration.

Type: `any`

Default: `{}`

### <a name="input_inventory_self_source_destination"></a> [inventory_self_source_destination](#input_inventory_self_source_destination)

Description: Whether or not the inventory source bucket is also the destination bucket.

Type: `bool`

Default: `false`

### <a name="input_inventory_source_account_id"></a> [inventory_source_account_id](#input_inventory_source_account_id)

Description: The inventory source account id.

Type: `string`

Default: `null`

### <a name="input_inventory_source_bucket_arn"></a> [inventory_source_bucket_arn](#input_inventory_source_bucket_arn)

Description: The inventory source bucket ARN.

Type: `string`

Default: `null`

### <a name="input_lifecycle_rule"></a> [lifecycle_rule](#input_lifecycle_rule)

Description: List of maps containing configuration of object lifecycle management.

Type: `any`

Default: `[]`

### <a name="input_logging"></a> [logging](#input_logging)

Description: Map containing access bucket logging configuration.

Type: `any`

Default: `{}`

### <a name="input_metric_configuration"></a> [metric_configuration](#input_metric_configuration)

Description: Map containing bucket metric configuration.

Type: `any`

Default: `[]`

### <a name="input_object_lock_configuration"></a> [object_lock_configuration](#input_object_lock_configuration)

Description: Map containing S3 object locking configuration.

Type: `any`

Default: `{}`

### <a name="input_object_lock_enabled"></a> [object_lock_enabled](#input_object_lock_enabled)

Description: Whether S3 bucket should have an Object Lock configuration enabled.

Type: `bool`

Default: `false`

### <a name="input_owner"></a> [owner](#input_owner)

Description: Bucket owner's display name and ID. Conflicts with `acl`

Type: `map(string)`

Default: `{}`

### <a name="input_policy"></a> [policy](#input_policy)

Description: (Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide.

Type: `string`

Default: `null`

### <a name="input_putin_khuylo"></a> [putin_khuylo](#input_putin_khuylo)

Description: Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!

Type: `bool`

Default: `true`

### <a name="input_replication_configuration"></a> [replication_configuration](#input_replication_configuration)

Description: Map containing cross-region replication configuration.

Type: `any`

Default: `{}`

### <a name="input_request_payer"></a> [request_payer](#input_request_payer)

Description: (Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information.

Type: `string`

Default: `null`

### <a name="input_restrict_public_buckets"></a> [restrict_public_buckets](#input_restrict_public_buckets)

Description: Whether Amazon S3 should restrict public bucket policies for this bucket.

Type: `bool`

Default: `true`

### <a name="input_server_side_encryption_configuration"></a> [server_side_encryption_configuration](#input_server_side_encryption_configuration)

Description: Map containing server-side encryption configuration.

Type: `any`

Default: `{}`

### <a name="input_tags"></a> [tags](#input_tags)

Description: (Optional) A mapping of tags to assign to the bucket.

Type: `map(string)`

Default: `{}`

### <a name="input_versioning"></a> [versioning](#input_versioning)

Description: Map containing versioning configuration.

Type: `map(string)`

Default: `{}`

### <a name="input_website"></a> [website](#input_website)

Description: Map containing static web-site hosting or redirect configuration.

Type: `any`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_s3_bucket_arn"></a> [s3_bucket_arn](#output_s3_bucket_arn)

Description: The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.

### <a name="output_s3_bucket_bucket_domain_name"></a> [s3_bucket_bucket_domain_name](#output_s3_bucket_bucket_domain_name)

Description: The bucket domain name. Will be of format bucketname.s3.amazonaws.com.

### <a name="output_s3_bucket_bucket_regional_domain_name"></a> [s3_bucket_bucket_regional_domain_name](#output_s3_bucket_bucket_regional_domain_name)

Description: The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL.

### <a name="output_s3_bucket_hosted_zone_id"></a> [s3_bucket_hosted_zone_id](#output_s3_bucket_hosted_zone_id)

Description: The Route 53 Hosted Zone ID for this bucket's region.

### <a name="output_s3_bucket_id"></a> [s3_bucket_id](#output_s3_bucket_id)

Description: The name of the bucket.

### <a name="output_s3_bucket_lifecycle_configuration_rules"></a> [s3_bucket_lifecycle_configuration_rules](#output_s3_bucket_lifecycle_configuration_rules)

Description: The lifecycle rules of the bucket, if the bucket is configured with lifecycle rules. If not, this will be an empty string.

### <a name="output_s3_bucket_policy"></a> [s3_bucket_policy](#output_s3_bucket_policy)

Description: The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string.

### <a name="output_s3_bucket_region"></a> [s3_bucket_region](#output_s3_bucket_region)

Description: The AWS region this bucket resides in.

### <a name="output_s3_bucket_website_domain"></a> [s3_bucket_website_domain](#output_s3_bucket_website_domain)

Description: The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records.

### <a name="output_s3_bucket_website_endpoint"></a> [s3_bucket_website_endpoint](#output_s3_bucket_website_endpoint)

Description: The website endpoint, if the bucket is configured with a website. If not, this will be an empty string.
