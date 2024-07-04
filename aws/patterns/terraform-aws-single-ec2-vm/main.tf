module "terraform_aws_single_ec2_vm" {
  #checkov:skip=CKV_TF_1: Ensure Terraform module sources use a commit hash
  source  = "app.terraform.io/nolan/single-ec2-vm/aws"
  version = "0.0.1"

  name    = var.name
  os_type = var.os_type
}
