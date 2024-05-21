<!-- BEGIN_TF_DOCS -->
What is virtual network and subnet?

Azure Virtual Network is a service that provides the fundamental building block for your private network in Azure. An instance of the service (a virtual network) enables many types of Azure resources to securely communicate with each other, the internet, and on-premises networks. These Azure resources include virtual machines (VMs).

these resources are created by using terraform module.

```hcl
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
```

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Resources

The following resources are used by this module:

- [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) (resource)
- [azurerm_virtual_network.vnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_address_space"></a> [address\_space](#input\_address\_space)

Description: n/a

Type: `list(string)`

### <a name="input_location"></a> [location](#input\_location)

Description: n/a

Type: `string`

### <a name="input_rg-details"></a> [rg-details](#input\_rg-details)

Description: n/a

Type: `string`

### <a name="input_subnet-name"></a> [subnet-name](#input\_subnet-name)

Description: n/a

Type:

```hcl
map(object({
      name = string
      newbits = number
      netnum = number

    }))
```

### <a name="input_vnet-name"></a> [vnet-name](#input\_vnet-name)

Description: n/a

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_subnets"></a> [subnets](#output\_subnets)

Description: n/a

### <a name="output_vnets"></a> [vnets](#output\_vnets)

Description: n/a

## Modules

No modules.

This is sample virtula network and subnet using terraform module for learning purpose ny Aflal.
<!-- END_TF_DOCS -->