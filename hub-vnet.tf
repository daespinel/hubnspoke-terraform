locals {
  prefix-hub         = "hub"
  hub-location       = "eastus"
  hub-resource-group = "hub-vnet-rg"
  shared-key         = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

resource "azurerm_resource_group" "hub-vnet-rg" {
  name     = locals.hub-resource-group
  location = locals.hub-location
}

resource "azurerm_virtual_network" "hub-vnet" {
  name = "${locals.prefix-hub}-vnet"
  location = azurerm_resource_group.hub-vnet-rg.location
  resource_group_name = azurerm_resource_group.hub-vnet-rg.name
  address_space = ["10.0.0.0/16"]

  tags = {
    environment = "hub-spoke"
  }
}