variable "name" {
  description = "Storage Account name (lowercase alphanumeric, 3..24, globally unique)"
  type        = string
  validation {
    condition = (
      length(var.name) >= 3 &&
      length(var.name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.name))
    )
    error_message = "Storage name must be 3..24 chars, lowercase alphanumeric only."
  }
}

variable "location" {
  description = "Azure region (e.g., westeurope)"
  type        = string
}

variable "resource_group_name" {
  description = "Target Resource Group name"
  type        = string
}

variable "account_tier" {
  description = "Storage tier (Standard or Premium)"
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "replication_type" {
  description = "Replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS","GRS","RAGRS","ZRS","GZRS","RAGZRS"], var.replication_type)
    error_message = "Invalid replication type."
  }
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}