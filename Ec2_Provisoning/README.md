# EC2 Provisioning with Terraform

A simple Terraform project to provision EC2 instances on AWS with workspace-based configuration.

## What it does

- Provisions EC2 instances on AWS (us-east-1 region)
- Uses Terraform workspaces for environment-specific configurations
- Supports dev and prod environments with different instance types

## Configuration

- **Dev workspace**: t2.medium instances tagged as "Dev-server"
- **Prod workspace**: t2.large instances tagged as "Prod-server"
- **AMI**: Uses Ubuntu 20.04 LTS (ami-02d7fd1c2af6eead0)

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Select workspace:
   ```bash
   terraform workspace select dev    # or prod
   ```

3. Plan and apply:
   ```bash
   terraform plan
   terraform apply
   ```

## Files

- `main.tf` - Main configuration and module call
- `variables.tf` - Variable definitions
- `terraform.tfvars` - AMI configuration
- `modules/ec2_instances/` - EC2 instance module
