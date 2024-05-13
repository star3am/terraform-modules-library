provider "aws" {
}

locals {
  avzone = var.s3_availability_zone
}

resource "aws_s3_directory_bucket" "single_az_bucket" {
  bucket = "single-az-bucket--${local.avzone}--x-s3"

  location {
    name = local.avzone
  }
}
