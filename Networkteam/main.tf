terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.1.0"
    }
  }
}
provider "azurerm" {
    features {
      
    }
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "vnet_purpose" {
  type = string
  default = "demo"
}


data "azurerm_resource_group" "existing_rg" {
  name = "dev-demo-rg"  
}
module "virtual_network" {
    source  = "aflalahmad/virtual-network/azurerm"
    version = "0.0.1"
    vnet-name = module.naming.virtual_network.name
    address_space = ["10.1.0.0/16"]
    rg-details = data.azurerm_resource_group.existing_rg
    location = "eastus"
    subnet-name     = {
    subnet1 = {
      name    = "subnet1"
      newbits = 8
      netnum  = 1
    }
    subnet2 = {
      name    = "subnet2"
      newbits = 8
      netnum  = 2
    }
    subnet3 = {
      name    = "subnet3"
      newbits = 8
      netnum  = 3
    }
    subnet4 = {
      name    = "subnet4"
      newbits = 8
      netnum  = 4
    }
    
  }
  environment = var.environment
  vnet_purpose = var.vnet_purpose
  
}