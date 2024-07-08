provider "aws" {
}

locals {
  name = "standard-mssql-${random_string.this.id}"
  # region = var.db_region

  # vpc_cidr = data.aws_vpc.default_vpc.cidr_block
  # vpc_azs  = slice(data.aws_availability_zones.available.names, 0, 3)

}

# data "aws_caller_identity" "current" {}

resource "random_string" "this" {
  length  = 5
  special = false
  upper   = false
}

# data "aws_availability_zones" "available" {}

data "aws_vpc" "default_vpc" {
  default = true
}

# data "aws_subnets" "apps_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default_vpc.id]
#   }

#   tags = {
#     Name = "*-APP-*"
#   }
# }

data "aws_subnets" "data_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }

  tags = {
    Name = "*-DB-*"
  }
}

resource "aws_db_subnet_group" "standard_mssql_subnet_group" {
  name       = "standard_mssql_subnet_group"
  subnet_ids = data.aws_subnets.data_subnets.ids
}

resource "aws_security_group" "standard_mssql_security_group" {
  #checkov:skip=CKV2_AWS_5: Ensure that Security Groups are attached to another resource
  name        = "Standard MS Sql DB Security Group"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
}

#checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
module "standard_mssql_db" {
  #checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
  # tflint-ignore: terraform_module_pinned_source
  source = "github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-rds?ref=main"
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  #checkov:skip=CKV2_AWS_5: Ensure that Security Groups are attached to another resource

  identifier = local.name

  engine               = "sqlserver-se"
  engine_version       = "15.00"
  family               = "sqlserver-se-15.0" # DB parameter group
  major_engine_version = "15.00"             # DB option group
  instance_class       = "db.m5.xlarge"
  license_model        = "license-included"
  timezone             = "AUS Eastern Standard Time"
  character_set_name   = "Latin1_General_CI_AS"

  allocated_storage     = 20
  max_allocated_storage = 100

  username = "standard_mssql_db_user"

  db_subnet_group_name   = aws_db_subnet_group.standard_mssql_subnet_group.name
  vpc_security_group_ids = [aws_security_group.standard_mssql_security_group.id]
  #For this engine multi_az on means instance always on and cannot temporarily stop
  #So only enable this when absolutely ready to incur cost for always on
  multi_az = false

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 30
  skip_final_snapshot     = true
  deletion_protection     = true
  apply_immediately       = true

  enabled_cloudwatch_logs_exports       = ["error"]
  create_cloudwatch_log_group           = true
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = "standard-mssql-monitoring-role"
  monitoring_role_use_name_prefix       = true
  monitoring_role_description           = "Standard MS Sql DB monitoring role"

  options                   = []
  create_db_parameter_group = false

  timeouts = {
    create = "60m"
    update = "60m"
    delete = "90m"
  }

}
