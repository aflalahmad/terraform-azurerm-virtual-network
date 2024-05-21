variable "vnet-name" {
    type = string
  
}
variable "rg-details" {
    type = string
  
}
variable "location" {
    type = string
  
}
variable "address_space" {
  type = list(string)
}

variable "subnet-name" {
    type = map(object({
      name = string
      newbits = number
      netnum = number

    }))
}