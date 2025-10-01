// Define Azure Container Registry resources here
resource "azurerm_container_registry" "container_registry" {
	name                = var.acr_name
	resource_group_name = var.resource_group_name
	location            = var.location
	sku                 = var.sku
	tags                = var.tags
}