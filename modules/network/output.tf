output "rg_name" {
  description = "The resource group name"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "The location of the network"
  value       = azurerm_resource_group.rg.location
}

output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}
