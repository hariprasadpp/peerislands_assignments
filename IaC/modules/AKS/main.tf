resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name           = var.node_pool_name
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id
    max_pods       = var.max_pods
  }

  network_profile {
    network_plugin     = "azure"
    service_cidr       = var.service_cidr 
    dns_service_ip     = var.dns_service_ip
    outbound_type      = "loadBalancer"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  azure_policy_enabled = true

  tags = var.tags
}
