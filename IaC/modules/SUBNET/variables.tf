variable "subnet_name" {
	description = "Name of the subnet"
	type        = string
}

variable "resource_group_name" {
	description = "Name of the resource group"
	type        = string
}

variable "virtual_network_name" {
	description = "Name of the virtual network"
	type        = string
}

variable "address_prefixes" {
	description = "List of address prefixes for the subnet"
	type        = list(string)
}
