// Define Azure Key Vault resources here
resource "azurerm_key_vault" "key_vault" {
	name                = var.keyvault_name
	location            = var.location
	resource_group_name = var.resource_group_name
	tenant_id           = var.tenant_id
	sku_name            = var.sku_name
	tags                = var.tags

	soft_delete_retention_days = 7
  	purge_protection_enabled   = true

	public_network_access_enabled = false
}