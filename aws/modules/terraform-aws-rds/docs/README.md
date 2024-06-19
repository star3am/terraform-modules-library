## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider_aws) (5.49.0)

## Modules

The following Modules are called:

### <a name="module_db_instance"></a> [db_instance](#module_db_instance)

Source: ./modules/db_instance

Version:

### <a name="module_db_instance_role_association"></a> [db_instance_role_association](#module_db_instance_role_association)

Source: ./modules/db_instance_role_association

Version:

### <a name="module_db_option_group"></a> [db_option_group](#module_db_option_group)

Source: ./modules/db_option_group

Version:

### <a name="module_db_parameter_group"></a> [db_parameter_group](#module_db_parameter_group)

Source: ./modules/db_parameter_group

Version:

### <a name="module_db_subnet_group"></a> [db_subnet_group](#module_db_subnet_group)

Source: ./modules/db_subnet_group

Version:

## Resources

The following resources are used by this module:

- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_identifier"></a> [identifier](#input_identifier)

Description: The name of the RDS instance

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allocated_storage"></a> [allocated_storage](#input_allocated_storage)

Description: The allocated storage in gigabytes

Type: `number`

Default: `null`

### <a name="input_allow_major_version_upgrade"></a> [allow_major_version_upgrade](#input_allow_major_version_upgrade)

Description: Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible

Type: `bool`

Default: `false`

### <a name="input_apply_immediately"></a> [apply_immediately](#input_apply_immediately)

Description: Specifies whether any database modifications are applied immediately, or during the next maintenance window

Type: `bool`

Default: `false`

### <a name="input_auto_minor_version_upgrade"></a> [auto_minor_version_upgrade](#input_auto_minor_version_upgrade)

Description: Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window

Type: `bool`

Default: `true`

### <a name="input_availability_zone"></a> [availability_zone](#input_availability_zone)

Description: The Availability Zone of the RDS instance

Type: `string`

Default: `null`

### <a name="input_backup_retention_period"></a> [backup_retention_period](#input_backup_retention_period)

Description: The days to retain backups for

Type: `number`

Default: `30`

### <a name="input_backup_window"></a> [backup_window](#input_backup_window)

Description: The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window

Type: `string`

Default: `null`

### <a name="input_blue_green_update"></a> [blue_green_update](#input_blue_green_update)

Description: Enables low-downtime updates using RDS Blue/Green deployments.

Type: `map(string)`

Default: `{}`

### <a name="input_ca_cert_identifier"></a> [ca_cert_identifier](#input_ca_cert_identifier)

Description: Specifies the identifier of the CA certificate for the DB instance

Type: `string`

Default: `null`

### <a name="input_character_set_name"></a> [character_set_name](#input_character_set_name)

Description: The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation

Type: `string`

Default: `null`

### <a name="input_cloudwatch_log_group_kms_key_id"></a> [cloudwatch_log_group_kms_key_id](#input_cloudwatch_log_group_kms_key_id)

Description: The ARN of the KMS Key to use when encrypting log data

Type: `string`

Default: `null`

### <a name="input_cloudwatch_log_group_retention_in_days"></a> [cloudwatch_log_group_retention_in_days](#input_cloudwatch_log_group_retention_in_days)

Description: The number of days to retain CloudWatch logs for the DB instance

Type: `number`

Default: `365`

### <a name="input_copy_tags_to_snapshot"></a> [copy_tags_to_snapshot](#input_copy_tags_to_snapshot)

Description: On delete, copy all Instance tags to the final snapshot

Type: `bool`

Default: `true`

### <a name="input_create_cloudwatch_log_group"></a> [create_cloudwatch_log_group](#input_create_cloudwatch_log_group)

Description: Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports`

Type: `bool`

Default: `false`

### <a name="input_create_db_instance"></a> [create_db_instance](#input_create_db_instance)

Description: Whether to create a database instance

Type: `bool`

Default: `true`

### <a name="input_create_db_option_group"></a> [create_db_option_group](#input_create_db_option_group)

Description: Create a database option group

Type: `bool`

Default: `true`

### <a name="input_create_db_parameter_group"></a> [create_db_parameter_group](#input_create_db_parameter_group)

Description: Whether to create a database parameter group

Type: `bool`

Default: `true`

### <a name="input_create_db_subnet_group"></a> [create_db_subnet_group](#input_create_db_subnet_group)

Description: Whether to create a database subnet group

Type: `bool`

Default: `false`

### <a name="input_create_monitoring_role"></a> [create_monitoring_role](#input_create_monitoring_role)

Description: Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs

Type: `bool`

Default: `false`

### <a name="input_custom_iam_instance_profile"></a> [custom_iam_instance_profile](#input_custom_iam_instance_profile)

Description: RDS custom iam instance profile

Type: `string`

Default: `null`

### <a name="input_db_instance_role_associations"></a> [db_instance_role_associations](#input_db_instance_role_associations)

Description: A map of DB instance supported feature name to role association ARNs.

Type: `map(any)`

Default: `{}`

### <a name="input_db_instance_tags"></a> [db_instance_tags](#input_db_instance_tags)

Description: Additional tags for the DB instance

Type: `map(string)`

Default: `{}`

### <a name="input_db_name"></a> [db_name](#input_db_name)

Description: The DB name to create. If omitted, no database is created initially

Type: `string`

Default: `null`

### <a name="input_db_option_group_tags"></a> [db_option_group_tags](#input_db_option_group_tags)

Description: Additional tags for the DB option group

Type: `map(string)`

Default: `{}`

### <a name="input_db_parameter_group_tags"></a> [db_parameter_group_tags](#input_db_parameter_group_tags)

Description: Additional tags for the  DB parameter group

Type: `map(string)`

Default: `{}`

### <a name="input_db_subnet_group_description"></a> [db_subnet_group_description](#input_db_subnet_group_description)

Description: Description of the DB subnet group to create

Type: `string`

Default: `null`

### <a name="input_db_subnet_group_name"></a> [db_subnet_group_name](#input_db_subnet_group_name)

Description: Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC

Type: `string`

Default: `null`

### <a name="input_db_subnet_group_tags"></a> [db_subnet_group_tags](#input_db_subnet_group_tags)

Description: Additional tags for the DB subnet group

Type: `map(string)`

Default: `{}`

### <a name="input_db_subnet_group_use_name_prefix"></a> [db_subnet_group_use_name_prefix](#input_db_subnet_group_use_name_prefix)

Description: Determines whether to use `subnet_group_name` as is or create a unique name beginning with the `subnet_group_name` as the prefix

Type: `bool`

Default: `true`

### <a name="input_delete_automated_backups"></a> [delete_automated_backups](#input_delete_automated_backups)

Description: Specifies whether to remove automated backups immediately after the DB instance is deleted

Type: `bool`

Default: `true`

### <a name="input_deletion_protection"></a> [deletion_protection](#input_deletion_protection)

Description: The database can't be deleted when this value is set to true

Type: `bool`

Default: `true`

### <a name="input_domain"></a> [domain](#input_domain)

Description: The ID of the Directory Service Active Directory domain to create the instance in

Type: `string`

Default: `null`

### <a name="input_domain_iam_role_name"></a> [domain_iam_role_name](#input_domain_iam_role_name)

Description: (Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service

Type: `string`

Default: `null`

### <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled_cloudwatch_logs_exports](#input_enabled_cloudwatch_logs_exports)

Description: List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)

Type: `list(string)`

Default:

```json
[
  "general",
  "error",
  "slowquery"
]
```

### <a name="input_engine"></a> [engine](#input_engine)

Description: The database engine to use

Type: `string`

Default: `null`

### <a name="input_engine_version"></a> [engine_version](#input_engine_version)

Description: The engine version to use

Type: `string`

Default: `null`

### <a name="input_family"></a> [family](#input_family)

Description: The family of the DB parameter group

Type: `string`

Default: `null`

### <a name="input_final_snapshot_identifier_prefix"></a> [final_snapshot_identifier_prefix](#input_final_snapshot_identifier_prefix)

Description: The name which is prefixed to the final snapshot on cluster destroy

Type: `string`

Default: `"final"`

### <a name="input_iam_database_authentication_enabled"></a> [iam_database_authentication_enabled](#input_iam_database_authentication_enabled)

Description: Specifies whether or not the mappings of AWS Identity and Access Management (IAM) accounts to database accounts are enabled

Type: `bool`

Default: `false`

### <a name="input_instance_class"></a> [instance_class](#input_instance_class)

Description: The instance type of the RDS instance

Type: `string`

Default: `null`

### <a name="input_instance_use_identifier_prefix"></a> [instance_use_identifier_prefix](#input_instance_use_identifier_prefix)

Description: Determines whether to use `identifier` as is or create a unique identifier beginning with `identifier` as the specified prefix

Type: `bool`

Default: `false`

### <a name="input_iops"></a> [iops](#input_iops)

Description: The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' or `gp3`. See `notes` for limitations regarding this variable for `gp3`

Type: `number`

Default: `null`

### <a name="input_kms_key_id"></a> [kms_key_id](#input_kms_key_id)

Description: The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used. Be sure to use the full ARN, not a key alias.

Type: `string`

Default: `null`

### <a name="input_license_model"></a> [license_model](#input_license_model)

Description: License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1

Type: `string`

Default: `null`

### <a name="input_maintenance_window"></a> [maintenance_window](#input_maintenance_window)

Description: The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'

Type: `string`

Default: `null`

### <a name="input_major_engine_version"></a> [major_engine_version](#input_major_engine_version)

Description: Specifies the major version of the engine that this option group should be associated with

Type: `string`

Default: `null`

### <a name="input_manage_master_user_password"></a> [manage_master_user_password](#input_manage_master_user_password)

Description: Set to true to allow RDS to manage the master user password in Secrets Manager

Type: `bool`

Default: `true`

### <a name="input_master_user_secret_kms_key_id"></a> [master_user_secret_kms_key_id](#input_master_user_secret_kms_key_id)

Description:   The key ARN, key ID, alias ARN or alias name for the KMS key to encrypt the master user password secret in Secrets Manager.  
  If not specified, the default KMS key for your Amazon Web Services account is used.

Type: `string`

Default: `null`

### <a name="input_max_allocated_storage"></a> [max_allocated_storage](#input_max_allocated_storage)

Description: Specifies the value for Storage Autoscaling

Type: `number`

Default: `0`

### <a name="input_monitoring_interval"></a> [monitoring_interval](#input_monitoring_interval)

Description: The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60

Type: `number`

Default: `5`

### <a name="input_monitoring_role_arn"></a> [monitoring_role_arn](#input_monitoring_role_arn)

Description: The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero

Type: `string`

Default: `null`

### <a name="input_monitoring_role_description"></a> [monitoring_role_description](#input_monitoring_role_description)

Description: Description of the monitoring IAM role

Type: `string`

Default: `null`

### <a name="input_monitoring_role_name"></a> [monitoring_role_name](#input_monitoring_role_name)

Description: Name of the IAM role which will be created when create_monitoring_role is enabled

Type: `string`

Default: `"rds-monitoring-role"`

### <a name="input_monitoring_role_permissions_boundary"></a> [monitoring_role_permissions_boundary](#input_monitoring_role_permissions_boundary)

Description: ARN of the policy that is used to set the permissions boundary for the monitoring IAM role

Type: `string`

Default: `null`

### <a name="input_monitoring_role_use_name_prefix"></a> [monitoring_role_use_name_prefix](#input_monitoring_role_use_name_prefix)

Description: Determines whether to use `monitoring_role_name` as is or create a unique identifier beginning with `monitoring_role_name` as the specified prefix

Type: `bool`

Default: `false`

### <a name="input_multi_az"></a> [multi_az](#input_multi_az)

Description: Specifies if the RDS instance is multi-AZ

Type: `bool`

Default: `true`

### <a name="input_nchar_character_set_name"></a> [nchar_character_set_name](#input_nchar_character_set_name)

Description: The national character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for Oracle instances. This can't be changed.

Type: `string`

Default: `null`

### <a name="input_network_type"></a> [network_type](#input_network_type)

Description: The type of network stack to use

Type: `string`

Default: `null`

### <a name="input_option_group_description"></a> [option_group_description](#input_option_group_description)

Description: The description of the option group

Type: `string`

Default: `null`

### <a name="input_option_group_name"></a> [option_group_name](#input_option_group_name)

Description: Name of the option group

Type: `string`

Default: `null`

### <a name="input_option_group_timeouts"></a> [option_group_timeouts](#input_option_group_timeouts)

Description: Define maximum timeout for deletion of `aws_db_option_group` resource

Type: `map(string)`

Default: `{}`

### <a name="input_option_group_use_name_prefix"></a> [option_group_use_name_prefix](#input_option_group_use_name_prefix)

Description: Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix

Type: `bool`

Default: `true`

### <a name="input_options"></a> [options](#input_options)

Description: A list of Options to apply

Type: `any`

Default: `[]`

### <a name="input_parameter_group_description"></a> [parameter_group_description](#input_parameter_group_description)

Description: Description of the DB parameter group to create

Type: `string`

Default: `null`

### <a name="input_parameter_group_name"></a> [parameter_group_name](#input_parameter_group_name)

Description: Name of the DB parameter group to associate or create

Type: `string`

Default: `null`

### <a name="input_parameter_group_use_name_prefix"></a> [parameter_group_use_name_prefix](#input_parameter_group_use_name_prefix)

Description: Determines whether to use `parameter_group_name` as is or create a unique name beginning with the `parameter_group_name` as the prefix

Type: `bool`

Default: `true`

### <a name="input_parameters"></a> [parameters](#input_parameters)

Description: A list of DB parameters (map) to apply

Type: `list(map(string))`

Default: `[]`

### <a name="input_password"></a> [password](#input_password)

Description:   Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.  
  The password provided will not be used if `manage_master_user_password` is set to true.

Type: `string`

Default: `null`

### <a name="input_performance_insights_enabled"></a> [performance_insights_enabled](#input_performance_insights_enabled)

Description: Specifies whether Performance Insights are enabled

Type: `bool`

Default: `true`

### <a name="input_performance_insights_kms_key_id"></a> [performance_insights_kms_key_id](#input_performance_insights_kms_key_id)

Description: The ARN for the KMS key to encrypt Performance Insights data

Type: `string`

Default: `null`

### <a name="input_performance_insights_retention_period"></a> [performance_insights_retention_period](#input_performance_insights_retention_period)

Description: The amount of time in days to retain Performance Insights data. Valid values are `7`, `731` (2 years) or a multiple of `31`

Type: `number`

Default: `7`

### <a name="input_port"></a> [port](#input_port)

Description: The port on which the DB accepts connections

Type: `string`

Default: `null`

### <a name="input_publicly_accessible"></a> [publicly_accessible](#input_publicly_accessible)

Description: Bool to control if instance is publicly accessible

Type: `bool`

Default: `false`

### <a name="input_putin_khuylo"></a> [putin_khuylo](#input_putin_khuylo)

Description: Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!

Type: `bool`

Default: `true`

### <a name="input_replica_mode"></a> [replica_mode](#input_replica_mode)

Description: Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified

Type: `string`

Default: `null`

### <a name="input_replicate_source_db"></a> [replicate_source_db](#input_replicate_source_db)

Description: Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate

Type: `string`

Default: `null`

### <a name="input_restore_to_point_in_time"></a> [restore_to_point_in_time](#input_restore_to_point_in_time)

Description: Restore to a point in time (MySQL is NOT supported)

Type: `map(string)`

Default: `null`

### <a name="input_s3_import"></a> [s3_import](#input_s3_import)

Description: Restore from a Percona Xtrabackup in S3 (only MySQL is supported)

Type: `map(string)`

Default: `null`

### <a name="input_skip_final_snapshot"></a> [skip_final_snapshot](#input_skip_final_snapshot)

Description: Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted

Type: `bool`

Default: `false`

### <a name="input_snapshot_identifier"></a> [snapshot_identifier](#input_snapshot_identifier)

Description: Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05

Type: `string`

Default: `null`

### <a name="input_storage_encrypted"></a> [storage_encrypted](#input_storage_encrypted)

Description: Specifies whether the DB instance is encrypted

Type: `bool`

Default: `true`

### <a name="input_storage_throughput"></a> [storage_throughput](#input_storage_throughput)

Description: Storage throughput value for the DB instance. See `notes` for limitations regarding this variable for `gp3`

Type: `number`

Default: `null`

### <a name="input_storage_type"></a> [storage_type](#input_storage_type)

Description: One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter

Type: `string`

Default: `null`

### <a name="input_subnet_ids"></a> [subnet_ids](#input_subnet_ids)

Description: A list of VPC subnet IDs

Type: `list(string)`

Default: `[]`

### <a name="input_tags"></a> [tags](#input_tags)

Description: A mapping of tags to assign to all resources

Type: `map(string)`

Default: `{}`

### <a name="input_timeouts"></a> [timeouts](#input_timeouts)

Description: Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times

Type: `map(string)`

Default: `{}`

### <a name="input_timezone"></a> [timezone](#input_timezone)

Description: Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information

Type: `string`

Default: `null`

### <a name="input_username"></a> [username](#input_username)

Description: Username for the master DB user

Type: `string`

Default: `null`

### <a name="input_vpc_security_group_ids"></a> [vpc_security_group_ids](#input_vpc_security_group_ids)

Description: List of VPC security groups to associate

Type: `list(string)`

Default: `[]`

## Outputs

The following outputs are exported:

### <a name="output_account_id"></a> [account_id](#output_account_id)

Description: AWS Account ID

### <a name="output_db_instance_address"></a> [db_instance_address](#output_db_instance_address)

Description: The address of the RDS instance

### <a name="output_db_instance_arn"></a> [db_instance_arn](#output_db_instance_arn)

Description: The ARN of the RDS instance

### <a name="output_db_instance_availability_zone"></a> [db_instance_availability_zone](#output_db_instance_availability_zone)

Description: The availability zone of the RDS instance

### <a name="output_db_instance_ca_cert_identifier"></a> [db_instance_ca_cert_identifier](#output_db_instance_ca_cert_identifier)

Description: Specifies the identifier of the CA certificate for the DB instance

### <a name="output_db_instance_cloudwatch_log_groups"></a> [db_instance_cloudwatch_log_groups](#output_db_instance_cloudwatch_log_groups)

Description: Map of CloudWatch log groups created and their attributes

### <a name="output_db_instance_domain"></a> [db_instance_domain](#output_db_instance_domain)

Description: The ID of the Directory Service Active Directory domain the instance is joined to

### <a name="output_db_instance_domain_iam_role_name"></a> [db_instance_domain_iam_role_name](#output_db_instance_domain_iam_role_name)

Description: The name of the IAM role to be used when making API calls to the Directory Service

### <a name="output_db_instance_endpoint"></a> [db_instance_endpoint](#output_db_instance_endpoint)

Description: The connection endpoint

### <a name="output_db_instance_engine"></a> [db_instance_engine](#output_db_instance_engine)

Description: The database engine

### <a name="output_db_instance_engine_version_actual"></a> [db_instance_engine_version_actual](#output_db_instance_engine_version_actual)

Description: The running version of the database

### <a name="output_db_instance_hosted_zone_id"></a> [db_instance_hosted_zone_id](#output_db_instance_hosted_zone_id)

Description: The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)

### <a name="output_db_instance_identifier"></a> [db_instance_identifier](#output_db_instance_identifier)

Description: The RDS instance identifier

### <a name="output_db_instance_master_user_secret_arn"></a> [db_instance_master_user_secret_arn](#output_db_instance_master_user_secret_arn)

Description: The ARN of the master user secret (Only available when manage_master_user_password is set to true)

### <a name="output_db_instance_name"></a> [db_instance_name](#output_db_instance_name)

Description: The database name

### <a name="output_db_instance_port"></a> [db_instance_port](#output_db_instance_port)

Description: The database port

### <a name="output_db_instance_resource_id"></a> [db_instance_resource_id](#output_db_instance_resource_id)

Description: The RDS Resource ID of this instance

### <a name="output_db_instance_role_associations"></a> [db_instance_role_associations](#output_db_instance_role_associations)

Description: A map of DB Instance Identifiers and IAM Role ARNs separated by a comma

### <a name="output_db_instance_status"></a> [db_instance_status](#output_db_instance_status)

Description: The RDS instance status

### <a name="output_db_instance_username"></a> [db_instance_username](#output_db_instance_username)

Description: The master username for the database

### <a name="output_db_listener_endpoint"></a> [db_listener_endpoint](#output_db_listener_endpoint)

Description: Specifies the listener connection endpoint for SQL Server Always On

### <a name="output_db_option_group_arn"></a> [db_option_group_arn](#output_db_option_group_arn)

Description: The ARN of the db option group

### <a name="output_db_option_group_id"></a> [db_option_group_id](#output_db_option_group_id)

Description: The db option group id

### <a name="output_db_parameter_group_arn"></a> [db_parameter_group_arn](#output_db_parameter_group_arn)

Description: The ARN of the db parameter group

### <a name="output_db_parameter_group_id"></a> [db_parameter_group_id](#output_db_parameter_group_id)

Description: The db parameter group id

### <a name="output_db_subnet_group_arn"></a> [db_subnet_group_arn](#output_db_subnet_group_arn)

Description: The ARN of the db subnet group

### <a name="output_db_subnet_group_id"></a> [db_subnet_group_id](#output_db_subnet_group_id)

Description: The db subnet group name

### <a name="output_enhanced_monitoring_iam_role_arn"></a> [enhanced_monitoring_iam_role_arn](#output_enhanced_monitoring_iam_role_arn)

Description: The Amazon Resource Name (ARN) specifying the monitoring role

### <a name="output_enhanced_monitoring_iam_role_name"></a> [enhanced_monitoring_iam_role_name](#output_enhanced_monitoring_iam_role_name)

Description: The name of the monitoring role
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db_instance"></a> [db\_instance](#module\_db\_instance) | ./modules/db_instance | n/a |
| <a name="module_db_instance_role_association"></a> [db\_instance\_role\_association](#module\_db\_instance\_role\_association) | ./modules/db_instance_role_association | n/a |
| <a name="module_db_option_group"></a> [db\_option\_group](#module\_db\_option\_group) | ./modules/db_option_group | n/a |
| <a name="module_db_parameter_group"></a> [db\_parameter\_group](#module\_db\_parameter\_group) | ./modules/db_parameter_group | n/a |
| <a name="module_db_subnet_group"></a> [db\_subnet\_group](#module\_db\_subnet\_group) | ./modules/db_subnet_group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gigabytes | `number` | `null` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone of the RDS instance | `string` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for | `number` | `30` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance\_window | `string` | `null` | no |
| <a name="input_blue_green_update"></a> [blue\_green\_update](#input\_blue\_green\_update) | Enables low-downtime updates using RDS Blue/Green deployments. | `map(string)` | `{}` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | Specifies the identifier of the CA certificate for the DB instance | `string` | `null` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS and Collations and Character Sets for Microsoft SQL Server for more information. This can only be set on creation | `string` | `null` | no |
| <a name="input_cloudwatch_log_group_kms_key_id"></a> [cloudwatch\_log\_group\_kms\_key\_id](#input\_cloudwatch\_log\_group\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data | `string` | `null` | no |
| <a name="input_cloudwatch_log_group_retention_in_days"></a> [cloudwatch\_log\_group\_retention\_in\_days](#input\_cloudwatch\_log\_group\_retention\_in\_days) | The number of days to retain CloudWatch logs for the DB instance | `number` | `365` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | On delete, copy all Instance tags to the final snapshot | `bool` | `true` | no |
| <a name="input_create_cloudwatch_log_group"></a> [create\_cloudwatch\_log\_group](#input\_create\_cloudwatch\_log\_group) | Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports` | `bool` | `false` | no |
| <a name="input_create_db_instance"></a> [create\_db\_instance](#input\_create\_db\_instance) | Whether to create a database instance | `bool` | `true` | no |
| <a name="input_create_db_option_group"></a> [create\_db\_option\_group](#input\_create\_db\_option\_group) | Create a database option group | `bool` | `true` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | Whether to create a database parameter group | `bool` | `true` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | Whether to create a database subnet group | `bool` | `false` | no |
| <a name="input_create_monitoring_role"></a> [create\_monitoring\_role](#input\_create\_monitoring\_role) | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs | `bool` | `false` | no |
| <a name="input_custom_iam_instance_profile"></a> [custom\_iam\_instance\_profile](#input\_custom\_iam\_instance\_profile) | RDS custom iam instance profile | `string` | `null` | no |
| <a name="input_db_instance_role_associations"></a> [db\_instance\_role\_associations](#input\_db\_instance\_role\_associations) | A map of DB instance supported feature name to role association ARNs. | `map(any)` | `{}` | no |
| <a name="input_db_instance_tags"></a> [db\_instance\_tags](#input\_db\_instance\_tags) | Additional tags for the DB instance | `map(string)` | `{}` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The DB name to create. If omitted, no database is created initially | `string` | `null` | no |
| <a name="input_db_option_group_tags"></a> [db\_option\_group\_tags](#input\_db\_option\_group\_tags) | Additional tags for the DB option group | `map(string)` | `{}` | no |
| <a name="input_db_parameter_group_tags"></a> [db\_parameter\_group\_tags](#input\_db\_parameter\_group\_tags) | Additional tags for the  DB parameter group | `map(string)` | `{}` | no |
| <a name="input_db_subnet_group_description"></a> [db\_subnet\_group\_description](#input\_db\_subnet\_group\_description) | Description of the DB subnet group to create | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | `string` | `null` | no |
| <a name="input_db_subnet_group_tags"></a> [db\_subnet\_group\_tags](#input\_db\_subnet\_group\_tags) | Additional tags for the DB subnet group | `map(string)` | `{}` | no |
| <a name="input_db_subnet_group_use_name_prefix"></a> [db\_subnet\_group\_use\_name\_prefix](#input\_db\_subnet\_group\_use\_name\_prefix) | Determines whether to use `subnet_group_name` as is or create a unique name beginning with the `subnet_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | The database can't be deleted when this value is set to true | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The ID of the Directory Service Active Directory domain to create the instance in | `string` | `null` | no |
| <a name="input_domain_iam_role_name"></a> [domain\_iam\_role\_name](#input\_domain\_iam\_role\_name) | (Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service | `string` | `null` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL) | `list(string)` | <pre>[<br>  "general",<br>  "error",<br>  "slowquery"<br>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the DB parameter group | `string` | `null` | no |
| <a name="input_final_snapshot_identifier_prefix"></a> [final\_snapshot\_identifier\_prefix](#input\_final\_snapshot\_identifier\_prefix) | The name which is prefixed to the final snapshot on cluster destroy | `string` | `"final"` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or not the mappings of AWS Identity and Access Management (IAM) accounts to database accounts are enabled | `bool` | `false` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the RDS instance | `string` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `string` | `null` | no |
| <a name="input_instance_use_identifier_prefix"></a> [instance\_use\_identifier\_prefix](#input\_instance\_use\_identifier\_prefix) | Determines whether to use `identifier` as is or create a unique identifier beginning with `identifier` as the specified prefix | `bool` | `false` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' or `gp3`. See `notes` for limitations regarding this variable for `gp3` | `number` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage\_encrypted is set to true and kms\_key\_id is not specified the default KMS key created in your account will be used. Be sure to use the full ARN, not a key alias. | `string` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | `string` | `null` | no |
| <a name="input_major_engine_version"></a> [major\_engine\_version](#input\_major\_engine\_version) | Specifies the major version of the engine that this option group should be associated with | `string` | `null` | no |
| <a name="input_manage_master_user_password"></a> [manage\_master\_user\_password](#input\_manage\_master\_user\_password) | Set to true to allow RDS to manage the master user password in Secrets Manager | `bool` | `true` | no |
| <a name="input_master_user_secret_kms_key_id"></a> [master\_user\_secret\_kms\_key\_id](#input\_master\_user\_secret\_kms\_key\_id) | The key ARN, key ID, alias ARN or alias name for the KMS key to encrypt the master user password secret in Secrets Manager.<br>  If not specified, the default KMS key for your Amazon Web Services account is used. | `string` | `null` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | Specifies the value for Storage Autoscaling | `number` | `0` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60 | `number` | `5` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring\_interval is non-zero | `string` | `null` | no |
| <a name="input_monitoring_role_description"></a> [monitoring\_role\_description](#input\_monitoring\_role\_description) | Description of the monitoring IAM role | `string` | `null` | no |
| <a name="input_monitoring_role_name"></a> [monitoring\_role\_name](#input\_monitoring\_role\_name) | Name of the IAM role which will be created when create\_monitoring\_role is enabled | `string` | `"rds-monitoring-role"` | no |
| <a name="input_monitoring_role_permissions_boundary"></a> [monitoring\_role\_permissions\_boundary](#input\_monitoring\_role\_permissions\_boundary) | ARN of the policy that is used to set the permissions boundary for the monitoring IAM role | `string` | `null` | no |
| <a name="input_monitoring_role_use_name_prefix"></a> [monitoring\_role\_use\_name\_prefix](#input\_monitoring\_role\_use\_name\_prefix) | Determines whether to use `monitoring_role_name` as is or create a unique identifier beginning with `monitoring_role_name` as the specified prefix | `bool` | `false` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Specifies if the RDS instance is multi-AZ | `bool` | `true` | no |
| <a name="input_nchar_character_set_name"></a> [nchar\_character\_set\_name](#input\_nchar\_character\_set\_name) | The national character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for Oracle instances. This can't be changed. | `string` | `null` | no |
| <a name="input_network_type"></a> [network\_type](#input\_network\_type) | The type of network stack to use | `string` | `null` | no |
| <a name="input_option_group_description"></a> [option\_group\_description](#input\_option\_group\_description) | The description of the option group | `string` | `null` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | Name of the option group | `string` | `null` | no |
| <a name="input_option_group_timeouts"></a> [option\_group\_timeouts](#input\_option\_group\_timeouts) | Define maximum timeout for deletion of `aws_db_option_group` resource | `map(string)` | `{}` | no |
| <a name="input_option_group_use_name_prefix"></a> [option\_group\_use\_name\_prefix](#input\_option\_group\_use\_name\_prefix) | Determines whether to use `option_group_name` as is or create a unique name beginning with the `option_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_options"></a> [options](#input\_options) | A list of Options to apply | `any` | `[]` | no |
| <a name="input_parameter_group_description"></a> [parameter\_group\_description](#input\_parameter\_group\_description) | Description of the DB parameter group to create | `string` | `null` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate or create | `string` | `null` | no |
| <a name="input_parameter_group_use_name_prefix"></a> [parameter\_group\_use\_name\_prefix](#input\_parameter\_group\_use\_name\_prefix) | Determines whether to use `parameter_group_name` as is or create a unique name beginning with the `parameter_group_name` as the prefix | `bool` | `true` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of DB parameters (map) to apply | `list(map(string))` | `[]` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.<br>  The password provided will not be used if `manage_master_user_password` is set to true. | `string` | `null` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | `true` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data | `string` | `null` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | The amount of time in days to retain Performance Insights data. Valid values are `7`, `731` (2 years) or a multiple of `31` | `number` | `7` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `string` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Bool to control if instance is publicly accessible | `bool` | `false` | no |
| <a name="input_putin_khuylo"></a> [putin\_khuylo](#input\_putin\_khuylo) | Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo! | `bool` | `true` | no |
| <a name="input_replica_mode"></a> [replica\_mode](#input\_replica\_mode) | Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified | `string` | `null` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate | `string` | `null` | no |
| <a name="input_restore_to_point_in_time"></a> [restore\_to\_point\_in\_time](#input\_restore\_to\_point\_in\_time) | Restore to a point in time (MySQL is NOT supported) | `map(string)` | `null` | no |
| <a name="input_s3_import"></a> [s3\_import](#input\_s3\_import) | Restore from a Percona Xtrabackup in S3 (only MySQL is supported) | `map(string)` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted | `bool` | `false` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05 | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB instance is encrypted | `bool` | `true` | no |
| <a name="input_storage_throughput"></a> [storage\_throughput](#input\_storage\_throughput) | Storage throughput value for the DB instance. See `notes` for limitations regarding this variable for `gp3` | `number` | `null` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (new generation of general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not. If you specify 'io1' or 'gp3' , you must also include a value for the 'iops' parameter | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of VPC subnet IDs | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times | `map(string)` | `{}` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information | `string` | `null` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | AWS Account ID |
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_ca_cert_identifier"></a> [db\_instance\_ca\_cert\_identifier](#output\_db\_instance\_ca\_cert\_identifier) | Specifies the identifier of the CA certificate for the DB instance |
| <a name="output_db_instance_cloudwatch_log_groups"></a> [db\_instance\_cloudwatch\_log\_groups](#output\_db\_instance\_cloudwatch\_log\_groups) | Map of CloudWatch log groups created and their attributes |
| <a name="output_db_instance_domain"></a> [db\_instance\_domain](#output\_db\_instance\_domain) | The ID of the Directory Service Active Directory domain the instance is joined to |
| <a name="output_db_instance_domain_iam_role_name"></a> [db\_instance\_domain\_iam\_role\_name](#output\_db\_instance\_domain\_iam\_role\_name) | The name of the IAM role to be used when making API calls to the Directory Service |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_engine"></a> [db\_instance\_engine](#output\_db\_instance\_engine) | The database engine |
| <a name="output_db_instance_engine_version_actual"></a> [db\_instance\_engine\_version\_actual](#output\_db\_instance\_engine\_version\_actual) | The running version of the database |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_identifier"></a> [db\_instance\_identifier](#output\_db\_instance\_identifier) | The RDS instance identifier |
| <a name="output_db_instance_master_user_secret_arn"></a> [db\_instance\_master\_user\_secret\_arn](#output\_db\_instance\_master\_user\_secret\_arn) | The ARN of the master user secret (Only available when manage\_master\_user\_password is set to true) |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_role_associations"></a> [db\_instance\_role\_associations](#output\_db\_instance\_role\_associations) | A map of DB Instance Identifiers and IAM Role ARNs separated by a comma |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_listener_endpoint"></a> [db\_listener\_endpoint](#output\_db\_listener\_endpoint) | Specifies the listener connection endpoint for SQL Server Always On |
| <a name="output_db_option_group_arn"></a> [db\_option\_group\_arn](#output\_db\_option\_group\_arn) | The ARN of the db option group |
| <a name="output_db_option_group_id"></a> [db\_option\_group\_id](#output\_db\_option\_group\_id) | The db option group id |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
| <a name="output_enhanced_monitoring_iam_role_arn"></a> [enhanced\_monitoring\_iam\_role\_arn](#output\_enhanced\_monitoring\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the monitoring role |
| <a name="output_enhanced_monitoring_iam_role_name"></a> [enhanced\_monitoring\_iam\_role\_name](#output\_enhanced\_monitoring\_iam\_role\_name) | The name of the monitoring role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
