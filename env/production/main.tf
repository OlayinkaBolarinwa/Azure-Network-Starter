terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

# ----------------------
# Network Module
# ----------------------
module "network" {
  source      = "../../modules/network"
  rg_name     = var.rg_name
  location    = var.location
  vnet_name   = var.vnet_name
  subnet_name = var.subnet_name
}

# ----------------------
# Public IP
# ----------------------
resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.name_prefix}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# ----------------------
# Network Interface
# ----------------------
resource "azurerm_network_interface" "nic" {
  name                = "${var.name_prefix}-nic"
  location            = module.network.location
  resource_group_name = module.network.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.subnet_id
    private_ip_address_allocation = var.private_ip != "" ? "Static" : "Dynamic"
    private_ip_address            = var.private_ip != "" ? var.private_ip : null
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

# ----------------------
# Network Security Group
# ----------------------
resource "azurerm_network_security_group" "vm_nsg" {
  name                = "${var.name_prefix}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

# SSH rule for VM
resource "azurerm_network_security_rule" "ssh" {
  name                        = "SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range            = "*"
  destination_port_range       = "22"
  source_address_prefix        = "*"
  destination_address_prefix   = "*"
  resource_group_name          = var.rg_name
  network_security_group_name = azurerm_network_security_group.vm_nsg.name
}

# Associate NSG to NIC (more secure than subnet association)
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}

# ----------------------
# Linux Virtual Machine
# ----------------------
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.name_prefix}-vm"
  resource_group_name = module.network.rg_name
  location            = module.network.location
  size                = var.vm_size
  admin_username      = var.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.ubuntu_image.publisher
    offer     = var.ubuntu_image.offer
    sku       = var.ubuntu_image.sku
    version   = var.ubuntu_image.version
  }
}

# ----------------------
# Outputs
# ----------------------
output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the VM"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
