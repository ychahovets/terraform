resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location

  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  # security baseline (v3+)
  min_tls_version          = "TLS1_2"
  public_network_access_enabled  = false
  allow_nested_items_to_be_public = false

  tags = var.tags
}
