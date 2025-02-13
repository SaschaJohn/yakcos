resource "azurerm_kubernetes_cluster" "aks" {
    name                = "aks-${var.name}"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg-aks.name
    dns_prefix          = "akscluster"

    default_node_pool {
        name       = "systempool"
        node_count = 1
        vm_size    = "Standard_D2as_v4"
        vnet_subnet_id = azurerm_subnet.node.id
    }

    identity {
        type = "SystemAssigned"
    }

    network_profile {
        network_plugin = "none"
        pod_cidr       = "${var.pod}"
        service_cidr   = "${var.service}"
        dns_service_ip = "${var.dns}"
    }

    tags = {
        environment = "development"
    }

#    provisioner "local-exec" {
#        command = "az aks get-credentials -g ${azurerm_resource_group.rg-aks.name} --name aks-${var.name} --subscription ${var.subscription}"
#    }

#    provisioner "local-exec" {
#        command = "cilium install --version 1.16.5 --set azure.resourceGroup=${azurerm_resource_group.rg-aks.name}  --set cluster.id=${var.id} --set ipam.operator.clusterPoolIPv4PodCIDRList='{${var.pod}}'"
#    }
}
