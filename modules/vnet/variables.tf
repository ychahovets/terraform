// terraform/modules/vnet/variables.tf
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "address_space" {
  description = "List of address spaces for VNet"
  type        = list(string)
}

variable "subnet_prefix" {
  description = "List of subnet prefixes"
  type        = list(string)
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where resources are created"
  type        = string
}