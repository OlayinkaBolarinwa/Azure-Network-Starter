variable "rg_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "The Azure location for the resources"
  type        = string
}

variable "vnet_name" {
  description = "The VNet name"
  type        = string
}

variable "subnet_name" {
  description = "The Subnet name"
  type        = string
}
