/*
 * # Debug Module
 *
 * This module outputs some Debug information.
 */

terraform {
  required_version = "~> 1.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "debug" {
  triggers = {
    module_folder            = var.module_folder
    module_name              = var.module_name
    module_written_for_cloud = var.module_written_for_cloud
  }
}
