variable "name" {
  type        = string
  description = "The name of the resource group. Changing this forces a new resource to be created."
}
variable "location" {
  type        = string
  description = "The Azure Region where the Resource Group should exist. Changing this forces a new resource to be created."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource group."
}
