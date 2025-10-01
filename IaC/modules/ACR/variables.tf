// Define input variables for ACR module here
variable "acr_name" {
	description = "Name of the Azure Container Registry"
	type        = string
}

variable "resource_group_name" {
	description = "Name of the resource group"
	type        = string
}

variable "location" {
	description = "Azure region"
	type        = string
}

variable "sku" {
	description = "SKU of the ACR"
	type        = string
	default     = "Basic"
}

variable "tags" {
	description = "A map of tags to be applied to the Container Registry"
	type        = map(string)
}