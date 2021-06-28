locals {
  spoke1-location       = "eastus"
  spoke1-resource-group = "spoke1-vnet-rg"
  prefix-spoke1         = "spoke1"
}

resource "azurerm_resource_group" "spoke1-vnet-rg" {
  name = locals.spoke1-resource-group
  location = locals.spoke1-location
}

resource "azurerm_virtual_network" "spoke1-vnet" {
  name = "${locals.prefix-spoke1}-vnet"
  location = azurerm_resource_group.spoke1-vnet-rg.location
  resource_group_name = azurerm_resource_group.spoke1-vnet-rg.name
  address_space = ["10.1.0.0/16"]

  tags = {
      environment = locals.prefix-spoke1
  }
}