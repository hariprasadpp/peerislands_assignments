variable "name" {
  description = "Name of the Log Analytics Workspace"
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

variable "tags" {
  description = "A map of tags to be applied"
  type        = map(string)
  default     = {}
}