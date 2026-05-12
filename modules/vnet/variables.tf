variable "name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the VNet"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the VNet"
  type        = map(string)
}