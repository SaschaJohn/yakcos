terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  alias = "mct"
  subscription_id = var.mct_subscription_id
  features {}
}

provider "azurerm" {
  alias = "vse"
  subscription_id = var.vse_subscription_id
  features {}
}