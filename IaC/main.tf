module "resource_group" {
  source   = "./modules/RESOURCEGROUP"
  name     = "${var.rg_name}-${terraform.workspace}-001"
  location = var.location
  tags     = merge(local.common_tags, {
    Resource_Type = "Resource Group"
	Environment   = "${terraform.workspace}"
  })
}

module "vpc" {
  source              = "./modules/VPC"
  vnet_name           = "${var.vnet_name}-${terraform.workspace}-001"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = merge(local.common_tags, {
    Resource_Type = "Network"
    Service       = "VNet"
	Environment   = "${terraform.workspace}"
  })
}

module "subnets" {
  for_each             = var.subnets
  source               = "./modules/SUBNET"
  subnet_name          = "${each.value.name}-${terraform.workspace}-001"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vpc.vnet_name
  address_prefixes     = each.value.address_prefixes
}

module "acr" {
  source              = "./modules/ACR"
  acr_name            = "${var.acr_name}${terraform.workspace}001"
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = merge(local.common_tags, {
    Resource_Type = "Container Registry"
    Service       = "ACR"
	Environment   = "${terraform.workspace}"
  })
}

module "keyvault" {
  source              = "./modules/KEYVAULT"
  keyvault_name       = "${var.kv_name}-${terraform.workspace}-001"
  location            = var.location
  resource_group_name = module.resource_group.name
  tenant_id           = var.tenant_id
  tags                = merge(local.common_tags, {
    Resource_Type = "Key Vault"
    Service       = "KeyVault"
    SecurityZone  = "High"
	Environment   = "${terraform.workspace}"
  })
}

module "log_analytics" {
  source              = "./modules/LOGANALYTICS"
  name                = "${var.aks_name}-${terraform.workspace}-logs"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = merge(local.common_tags, {
    Resource_Type = "Log Analytics"
    Service       = "Monitoring"
    Environment   = "${terraform.workspace}"
  })
}

module "aks" {
  source                     = "./modules/AKS"
  aks_name                   = "${var.aks_name}-${terraform.workspace}-001"
  location                   = var.location
  resource_group_name        = module.resource_group.name
  node_pool_name            = var.default_node_pool["name"]
  node_count                = var.default_node_pool["node_count"]
  vm_size                   = var.default_node_pool["vm_size"]
  dns_prefix                = var.aks_dns_prefix
  vnet_subnet_id            = module.subnets["aks"].subnet_id
  log_analytics_workspace_id = module.log_analytics.workspace_id
  tags                      = merge(local.common_tags, {
    Resource_Type = "Kubernetes Service"
    Service       = "AKS"
    Version       = "1.0.0"
    Environment   = "${terraform.workspace}"
  })
}
