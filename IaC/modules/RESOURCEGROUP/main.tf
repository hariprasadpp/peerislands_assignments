resource "azurerm_resource_group" "_resource_group" {
name = var.name
location = var.location
tags = var.tags
}