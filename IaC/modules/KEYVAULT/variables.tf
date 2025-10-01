variable "keyvault_name" {
	description = "Name of the Key Vault"
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

variable "tenant_id" {
	description = "Azure tenant ID"
	type        = string
}

variable "sku_name" {
	description = "SKU name for Key Vault"
	type        = string
	default     = "standard"
}

variable "tags" {
	description = "A map of tags to be applied to the Key Vault"
	type        = map(string)
}