// Define output values for AKS module here
output "aks_id" {
	description = "The ID of the AKS cluster"
	value       = azurerm_kubernetes_cluster.kubernetes_cluster.id
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw
  sensitive = true
}