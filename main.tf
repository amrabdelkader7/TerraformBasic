terraform {
  required_providers {
    azurerm= {
        source = "hashicorp/azurerm"
        version = "3.86.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
}

resource "azurerm_resource_group" "myrg" {
  name = "terraform-rg"
  location = "uk south"
}

resource "azurerm_virtual_network" "VN" {
  name = "amr-vnet"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mysubnet" {
  name = "amr-subnet"
  resource_group_name = azurerm_resource_group.myrg
  virtual_network_name = azurerm_virtual_network.VN
  address_prefixes = ["10.0.0.0/24"]
}

