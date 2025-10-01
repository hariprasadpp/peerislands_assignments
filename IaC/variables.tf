variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}
variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}
variable "rg_name" {
  default     = "rg-prod"
  description = "Name of the resource group"
}
variable "location" {
  default     = "eastus"
  description = "Azure region"
}
variable "vnet_name" {
  default     = "vnet-prod"
  description = "The name of the virtual network."
}
variable "address_space" {
  default     = ["10.0.0.0/16"]
  description = "The address space that is used by the virtual network."
}
variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    service          = string
  }))
  description = "Map of subnet configurations"
}
variable "acr_name" {
  default     = "acrprod123"
  description = "Name of the Azure Container Registry"
}
variable "kv_name" {
  default     = "kv-prod-123"
  description = "Name of the Azure Key Vault"
}
variable "aks_name" {
  default     = "aks-prod"
  description = "Name of the AKS cluster"
}
variable "aks_dns_prefix" {
  default     = "aksprod"
  description = "DNS prefix for the AKS cluster"
}
variable "default_node_pool" {
  default = {
    name            = "agentpool"
    node_count      = 1
    vm_size         = "Standard_DS2_v2"
    os_disk_size_gb = 128
    max_pods        = 110
  }
  description = "Default node pool configuration"
  type        = map(any)
}
# variable "kubeconfig_path" {
#   default     = "~/.kube/config"
#   description = "Path to the kubeconfig file"
# }
variable "environment" {
  default     = "prod"
  description = "Environment tag for resources"
}

