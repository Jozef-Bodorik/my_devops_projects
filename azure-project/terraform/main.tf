data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

module "network" {
  source          = "./modules/network"
  rg_name         = data.azurerm_resource_group.rg.name
  location        = data.azurerm_resource_group.rg.location
  name            = var.prefix
  vnet_name       = "${var.prefix}-vnet"
  address_space   = ["10.10.0.0/16"]
  subnet_name     = "aks-subnet"
  subnet_prefixes = ["10.10.1.0/24"]
}

module "acr" {
  source   = "./modules/acr"
  rg_name  = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  prefix   = var.prefix
}

module "aks" {
  source    = "./modules/aks"
  rg_name   = data.azurerm_resource_group.rg.name
  location  = data.azurerm_resource_group.rg.location
  prefix    = var.prefix
  subnet_id = module.network.subnet_id
}
