variable "name" {
  description = "Log Analytics workspace name"
  type        = string
  validation {
    condition     = length(var.name) >= 4 && length(var.name) <= 63
    error_message = "Workspace name must be 4..63 characters."
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

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30
  validation {
    condition     = var.retention_in_days >= 7 && var.retention_in_days <= 730
    error_message = "Retention must be between 7 and 730 days."
  }
}

variable "sku" {
  description = "Workspace SKU (PerGB2018, LACluster, etc.)"
  type        = string
  default     = "PerGB2018"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}