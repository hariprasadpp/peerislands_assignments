// Define output values for ACR module here
output "acr_id" {
  description = "The ID of the Azure Container Registry"
  value       = azurerm_container_registry.container_registry.id
}