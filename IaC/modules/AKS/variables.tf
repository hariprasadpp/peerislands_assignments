// Define input variables for AKS module here
variable "aks_name" {
	description = "Name of the AKS cluster"
	type        = string
}

variable "location" {
	description = "Azure region"
	type        = string
}

variable "resource_group_name" {
	description = "Name of the resource group"
	type        = string
}

variable "node_pool_name" {
	description = "Name of the node pool"
	type        = string
	default     = "default"
}

variable "node_count" {
	description = "Number of nodes in the pool"
	type        = number
	default     = 1
}

variable "vm_size" {
	description = "VM size for nodes"
	type        = string
	default     = "Standard_DS2_v2"
}
variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "environment" {
  description = "Environment tag for AKS cluster"
  type        = string
  default     = "Production"
}

variable "tags" {
  description = "A map of tags to be applied to the AKS cluster"
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for AKS monitoring"
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet where the AKS cluster will be deployed"
  type        = string
}

variable "service_cidr" {
  description = "Service CIDR for AKS cluster (must not overlap any VNet subnet)"
  type        = string
  default     = "10.1.0.0/16"  
}

variable "dns_service_ip" {
  description = "DNS service IP for AKS cluster (must be within service CIDR)"
  type        = string
  default     = "10.1.0.10"
}

variable "docker_bridge_cidr" {
  description = "Docker bridge network CIDR"
  type        = string
  default     = "172.17.0.1/16"
}

variable "max_pods" {
  description = "Maximum number of pods per node"
  type        = number
  default     = 110
}
