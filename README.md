\# Azure Network Starter



This project is a starter kit for setting up a basic Azure network environment using Terraform. 



It includes:

\- Virtual Network (VNet) and Subnets

\- Network Interface Cards (NICs)

\- Public IP for VMs

\- Linux Virtual Machine with SSH access

\- Network Security Groups (NSGs) with SSH rule



\## Purpose



This project is designed for learning and demonstration purposes. It shows how to:

\- Automate Azure networking with Terraform

\- Provision a VM with secure access

\- Configure NSGs and public IPs

\- Test connectivity to the VM



\## Getting Started



1\. Clone this repository:

```bash

git clone https://github.com/OlayinkaBolarinwa/Azure-Network-Starter.git





2\. Add your secrets in secrets.auto.tfvars (do not commit this file):



client\_id       = "<your-client-id>"

client\_secret   = "<your-client-secret>"

tenant\_id       = "<your-tenant-id>"

subscription\_id = "<your-subscription-id>"





3\.  Initialize Terraform:

terraform init





4.Plan and apply:

terraform plan

terraform apply



5\. SSH into the VM using the public IP:

ssh -i ~/.ssh/id\_rsa azureuser@<public-ip>



Notes



This project is mainly for training and experimentation.



Always keep your secrets safe and never push them to GitHub.







---



\### \*\*Step 4: Save and close\*\*

Press \*\*Ctrl+S\*\* to save, then close Notepad.



---



Now your project has a proper README.md explaining everything in plain English, ready to push to GitHub.  



If you want, I can \*\*also give a super concise version\*\* specifically for Global Talent Visa evidence — that’s more professional but still human-readable. Do you want me to do that next?



