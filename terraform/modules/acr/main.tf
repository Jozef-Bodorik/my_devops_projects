resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.prefix}acr${random_integer.suffix.result}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Basic"

  admin_enabled = true
}
