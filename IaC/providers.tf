terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatepeerislands"
    container_name       = "tfstate"
    key                  = "env-prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_client_config" "current" {
}