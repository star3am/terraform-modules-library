terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0, != 2.86"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source          = "../"
  location        = "australiaeast"
  resource_prefix = "test"
}
