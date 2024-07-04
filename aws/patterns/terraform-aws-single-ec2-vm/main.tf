module "terraform_aws_single_ec2_vm" {
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"

  name = var.name
  # os_type = var.os_type
}
