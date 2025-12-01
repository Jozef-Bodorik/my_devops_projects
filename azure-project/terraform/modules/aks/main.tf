resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-aks"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.prefix}-dns"

  default_node_pool {
    name                = "nodepool1"
    vm_size             = "Standard_D2s_v3"
    node_count          = 1
    vnet_subnet_id      = var.subnet_id
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}
