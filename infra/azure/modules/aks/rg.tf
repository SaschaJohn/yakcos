resource "azurerm_resource_group" "rg-aks" {
    name     = "rg-aks-${var.name}"
    location = var.location
}