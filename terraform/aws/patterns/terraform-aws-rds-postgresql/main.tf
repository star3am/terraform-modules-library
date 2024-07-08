provider "aws" {
}

locals {
  name = "standard-pg-${random_string.this.id}"
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

resource "aws_db_subnet_group" "standard_pg_subnet_group" {
  name       = "standard_pg_subnet_group"
  subnet_ids = data.aws_subnets.data_subnets.ids
}

resource "aws_security_group" "standard_pg_security_group" {
  #checkov:skip=CKV2_AWS_5: Ensure that Security Groups are attached to another resource
  name        = "Standard Postgresql DB Security Group"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
}

resource "aws_db_parameter_group" "standard_pg_parameters" {
  name   = local.name
  family = "postgres15"

  parameter {
    name         = "timezone"
    value        = "Australia/Sydney"
    apply_method = "pending-reboot"
  }
}

#checkov:skip=CKV_TF_2: "Ensure Terraform module sources use a tag with a version number"
module "standard_pg_db" {
  # tflint-ignore: terraform_module_pinned_source
  source = "github.com/star3am/terraform-modules-library//terraform/aws/modules/terraform-aws-rds?ref=main"
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  #checkov:skip=CKV2_AWS_5: Ensure that Security Groups are attached to another resource

  identifier = local.name

  engine               = "postgres"
  engine_version       = "15.3"
  family               = "postgres15" # DB parameter group
  major_engine_version = "15"         # DB option group
  instance_class       = "db.m5.xlarge"

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "standard_pg_db"
  username = "standard_pg_db_user"

  db_subnet_group_name                = aws_db_subnet_group.standard_pg_subnet_group.name
  vpc_security_group_ids              = [aws_security_group.standard_pg_security_group.id]
  multi_az                            = true
  iam_database_authentication_enabled = true

  maintenance_window      = "Mon:00:00-Mon:03:00"
  backup_window           = "03:00-06:00"
  backup_retention_period = 30
  skip_final_snapshot     = true
  deletion_protection     = true
  apply_immediately       = true

  enabled_cloudwatch_logs_exports       = ["postgresql", "upgrade"]
  create_cloudwatch_log_group           = true
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = "standard-pg-monitoring-role"
  monitoring_role_use_name_prefix       = true
  monitoring_role_description           = "Standard Postgresql DB monitoring role"
}
