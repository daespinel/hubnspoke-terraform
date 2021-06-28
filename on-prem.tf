locals {
  onprem-location       = "eastus"
  onprem-resource-group = "onprem-vnet-rg"
  prefix-onprem         = "onprem"
}

resource "azurerm_resource_group" "onprem-vnet-rg" {
  name     = locals.onprem-resource-group
  location = locals.onprem-location
}

resource "azurerm_virtual_network" "onprem-vnet" {
  name                = "onprem-vnet"
  location            = azurerm_resource_group.onprem-vnet-rg.location
  resource_group_name = azurerm_resource_group.onprem-vnet-rg.name
  address_space       = ["192.168.0.0/16"]
  tags = {
    environment = local.prefix-onprem
  }
}

resource "aurerm_subnet" "onprem-gateway-vnet" {
  name = "GatewaySubnet"
  resource_group_name = azurerm_resource_group.onprem-vnet-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  adress_prefixes = ["192.168.255.224/27"]
}