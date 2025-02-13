resource "azurerm_virtual_network" "vnet-aks-cluster" {
    name                = "vnet-aks-${var.name}"
    address_space       = ["${var.network}.0/24"]
    location            = azurerm_resource_group.rg-aks.location
    resource_group_name = azurerm_resource_group.rg-aks.name
}

resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg-aks.name
  virtual_network_name = azurerm_virtual_network.vnet-aks-cluster.name
  address_prefixes     = ["${var.network}.0/27"]
}

resource "azurerm_subnet" "node" {
  name                 = "snet-aks-${var.name}-node"
  resource_group_name  = azurerm_resource_group.rg-aks.name
  virtual_network_name = azurerm_virtual_network.vnet-aks-cluster.name
  address_prefixes     = ["${var.network}.128/25"]
}