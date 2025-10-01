// Define output values for KEYVAULT module here
output "keyvault_id" {
	description = "The ID of the Key Vault"
	value       = azurerm_key_vault.key_vault.id
}