// terraform/modules/vnet/outputs.tf
output "vnet_id" {
  description = "ID created VNet"
  value       = azurerm_virtual_network.this.id
}

output "subnet_id" {
  description = "ID created Subnet"
  value       = azurerm_subnet.this.id
}