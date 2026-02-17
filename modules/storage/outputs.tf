# modules/storage/outputs.tf

output "id" {
  description = "Storage Account resource ID"
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.this.name
}


output "primary_blob_endpoint" {
  description = "Primary Blob service endpoint (URL)"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_queue_endpoint" {
  description = "Primary Queue service endpoint (URL)"
  value       = azurerm_storage_account.this.primary_queue_endpoint
}

output "primary_table_endpoint" {
  description = "Primary Table service endpoint (URL)"
  value       = azurerm_storage_account.this.primary_table_endpoint
}

output "primary_file_endpoint" {
  description = "Primary File service endpoint (URL)"
  value       = azurerm_storage_account.this.primary_file_endpoint
}