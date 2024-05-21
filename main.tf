
module "naming" {
  source = "azure/naming/azurerm"
  version = "0.4.1"
  prefix = ["${var.environment}","${var.vnet_purpose}"]
}


data "azurerm_resource_group" "existing_rg" {
  name = "dev-demo-rg"  
}

resource "azurerm_virtual_network" "vnets" {
  name = module.naming.virtual_network.name
  resource_group_name = data.azurerm_resource_group.existing_rg
  location = var.location
  address_space = var.address_space
  tags = {
    Environment = var.environment
    Purpose = var.vnet_purpose

  }
}

resource "azurerm_subnet" "subnets" {

  for_each = var.subnet-name
  name                 = each.key
  address_prefixes     = [cidrsubnet(var.address_space[0], each.value.newbits,each.value.netnum)]
  resource_group_name  = data.azurerm_resource_group.existing_rg
  virtual_network_name = azurerm_virtual_network.vnets.name
 
  
}