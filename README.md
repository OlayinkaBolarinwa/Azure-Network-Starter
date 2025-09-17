# Azure Network Starter

This project is a starter kit for setting up a basic Azure network environment using Terraform.

## Features

- Virtual Network (VNet) and Subnets  
- Network Interface Cards (NICs)  
- Public IP for VMs  
- Linux Virtual Machine with SSH access  
- Network Security Groups (NSGs) with SSH rule  

## Purpose

This project is designed for learning and demonstration. It shows how to:

- Automate Azure networking with Terraform  
- Provision a VM with secure access  
- Configure NSGs and public IPs  
- Test connectivity to the VM  

## Getting Started

1. **Clone this repository**

   ```bash
   git clone https://github.com/OlayinkaBolarinwa/Azure-Network-Starter.git
   cd Azure-Network-Starter

Add your secrets in secrets.auto.tfvars (do not commit this file):

terraform init
terraform plan
terraform apply -auto-approve

Initialize Terraform
terraform init

Plan and apply
terraform plan
terraform apply

SSH into the VM using the public IP
ssh -i ~/.ssh/id_rsa azureuser@<public-ip>

Notes

This project is intended for training and experimentation.

Always keep your secrets safe and never push them to GitHub.
