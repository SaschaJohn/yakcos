module "cluster1" {
  source = "./modules/aks"
  providers = {
    azurerm = azurerm.mct
  }
  name = "cluster1"
  id="1"
  network= "192.168.1"
  pod = "10.1.0.0/16"
  service ="10.2.0.0/16"
  dns = "10.2.0.10"
  subscription="${var.mct_subscription_id}"

}

module "cluster2" {
  source = "./modules/aks"
  providers = {
    azurerm = azurerm.vse
  }
  name = "cluster2"
  id="2"
  network= "192.168.3"
  pod = "10.3.0.0/16"
  service ="10.4.0.0/16"
  dns = "10.4.0.10"
  subscription="${var.vse_subscription_id}"
}