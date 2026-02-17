// terraform/environments/dev/main.tf

locals {
  org            = "ych03"          # prefix 5 symbols
  env            = "dev"
  workload       = "core"
  location       = "westeurope"
  location_short = "weu"
  suffix         = "01"          # change if have conflict (Storage)

  tags = {
    env        = local.env
    owner      = "yurii"
    costcenter = "labs"
    workload   = local.workload
  }

  # shortname for Storage (only [a-z0-9],  24 symbols max, globally unique)
  st_base = "st${local.org}${local.env}${local.workload}${local.location_short}" # stycdevcoreweu
  st_name = substr(local.st_base, 0, 20) 
  st_full = "${local.st_name}${local.suffix}" # stycdevcoreweu01
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.org}-${local.env}-${local.workload}"
  location = local.location
  tags     = local.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "vnet-${local.org}-${local.env}-${local.workload}"
  subnet_name         = "snet-${local.org}-${local.env}-app"
  address_space       = ["10.10.0.0/16"]
  subnet_prefix       = ["10.10.1.0/24"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

module "log_analytics" {
  source              = "../../modules/log-analytics"
  name                = "log-${local.org}-${local.env}-${local.workload}-${local.location_short}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  retention_in_days   = 30
  tags                = local.tags
}

module "storage" {
  source              = "../../modules/storage"
  name                = lower(local.st_full)
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  account_tier        = "Standard"
  replication_type    = "LRS"
  tags                = local.tags
}

