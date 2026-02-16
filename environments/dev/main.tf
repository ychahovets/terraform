// terraform/environments/dev/main.tf

resource "azurerm_resource_group" "this" {
  name     = "rg-labs-core"
  location = "westeurope"
}


module "vnet" {
  source              = "../../modules/vnet"

  vnet_name           = "vnet-dev"
  subnet_name         = "subnet-dev"
  address_space       = ["10.10.0.0/16"]
  subnet_prefix       = ["10.10.1.0/24"]

  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}