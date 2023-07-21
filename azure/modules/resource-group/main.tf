/*
 * # Resource Group Module
 *
 * This module creates an empty Resource Group.
 */
terraform {
  required_version = "~> 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  tags = merge(var.tags, local.module_tags)
  module_tags = {
    "Module" = var.module_name
  }
}

data "azurerm_subscription" "module" {}

resource "azurerm_resource_group" "module" {
  name     = "${lookup(data.azurerm_subscription.module.tags, "shortName", data.azurerm_subscription.module.display_name)}-rg"
  location = var.location
  tags     = local.tags
}
