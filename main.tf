
module "naming" {
  source = "azure/naming/azurerm"
  version = "0.4.1"
  prefix = ["${var.environment}","${var.vnet_purpose}"]
}




resource "azurerm_virtual_network" "vnets" {
  name = var.vnet-name
  resource_group_name = module.naming.resource_group.name
  location = var.location
  address_space = var.address_space
}

resource "azurerm_subnet" "subnets" {

 for_each = var.subnet-name
  name                 = each.value
  address_prefixes     = [cidrsubnet(var.address_space[0], each.value.newbits,each.value.netnum)]
  resource_group_name  = module.naming.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnets.name
  
}