# ----------------------
# General
# ----------------------
variable "name_prefix" {
  type        = string
  description = "Prefix for all resources "
}

variable "rg_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

# ----------------------
# Network
# ----------------------
variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "private_ip" {
  type        = string
  description = "ip"
  default     = ""
}

# ----------------------
# VM
# ----------------------
variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Full path to SSH public key"
  default     = "C:/Users/bolar/.ssh/id_rsa.pub"
}

variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}

# ----------------------
# Ubuntu Jammy 22.04 LTS
# ----------------------
variable "ubuntu_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
