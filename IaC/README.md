# Infrastructure as Code (IaC) - Azure Resources Deployment

This directory contains Terraform configurations to deploy a production-ready infrastructure on Azure. The infrastructure includes Azure Kubernetes Service (AKS), Azure Container Registry (ACR), Virtual Network, Subnets, Key Vault, and Storage Account.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.0.0)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure Subscription with required permissions

## Infrastructure Components

The following Azure resources will be provisioned:

1. **Resource Group**
   - Central resource group for all components
   - Located in the specified Azure region

2. **Virtual Network & Subnets**
   - Virtual Network with customizable address space
   - Dedicated subnets for:
     - AKS cluster
     - Application Gateway
     - Other services

3. **Azure Kubernetes Service (AKS)**
   - Managed Kubernetes cluster
   - Integrated with Azure Virtual Network
   - Node pool configuration as specified

4. **Azure Container Registry (ACR)**
   - Private container registry
   - Integrated with AKS for image pulling

5. **Key Vault**
   - Secure secret management
   - Integration with other Azure services

6. **Storage Account**
   - General-purpose v2 storage
   - Used for persistent storage needs

## Directory Structure

```
IaC/
├── backend.tf          # State backend configuration
├── main.tf            # Main Terraform configuration
├── providers.tf       # Provider configuration
├── variables.tf       # Variable definitions
├── terraform.tfvars   # Variable values
└── modules/           # Reusable Terraform modules
    ├── ACR/
    ├── AKS/
    ├── KEYVAULT/
    ├── RESOURCEGROUP/
    ├── SUBNET/
    └── VPC/
```

## Getting Started

1. **Initialize Terraform**
   ```powershell
   terraform init
   ```

2. **Select or Create Workspace (Optional)**
   ```powershell
   # List available workspaces
   terraform workspace list

   # Create a new workspace
   terraform workspace new dev

   # Select an existing workspace
   terraform workspace select dev
   ```

3. **Review the Plan**
   ```powershell
   terraform plan -var-file="terraform.tfvars"
   ```

4. **Apply the Configuration**
   ```powershell
   terraform apply -var-file="terraform.tfvars"
   ```

5. **Destroy Resources (When Needed)**
   ```powershell
   terraform destroy -var-file="terraform.tfvars"
   ```

## Configuration

1. Update `terraform.tfvars` with your desired values:
   ```hcl
   resource_group_name = "your-rg-name"
   location           = "eastus2"
   # Other variables...
   ```

2. Configure backend storage in `backend.tf` (if using remote state)

3. Review and adjust module configurations in `main.tf`

## Best Practices

1. Use workspaces to manage different environments (dev, staging, prod)
2. Store sensitive values in Azure Key Vault
3. Use remote state storage for team collaboration
4. Tag resources appropriately for cost tracking
5. Review security configurations before deployment

## Notes

- The deployment may take 15-20 minutes to complete
- AKS deployments require proper RBAC permissions
- Ensure your subscription has enough quota for the requested resources

## Troubleshooting

Common issues and solutions:

1. **Authentication Issues**
   - Run `az login` to authenticate with Azure
   - Ensure your account has necessary permissions

2. **Resource Quotas**
   - Check your subscription limits
   - Request quota increases if needed

3. **Network Conflicts**
   - Verify VNET address spaces don't overlap
   - Check subnet configurations
