resource "azurerm_virtual_network" "vnets" {
  name = var.vnet-name
  resource_group_name = var.rg-details
  location = var.location
  address_space = var.address_space
}

resource "azurerm_subnet" "subnets" {

 for_each = var.subnet-name
  name                 = each.value
  address_prefixes     = [cidrsubnet(var.address_space[0], each.value.newbits,each.value.netnum)]
  resource_group_name  = var.rg-details
  virtual_network_name = azurerm_virtual_network.vnets.name
  
}