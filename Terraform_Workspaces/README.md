# Terraform Workspaces Example

This project demonstrates the use of Terraform workspaces and modules to manage AWS EC2 instances in different environments (e.g., dev, prod).

## Usage

1. Initialize the project:
   ```sh
   terraform init
   ```
2. Select or create a workspace (e.g., dev or prod):
   ```sh
   terraform workspace select dev
   # or create a new one
   terraform workspace new dev
   ```
3. Plan the deployment:
   ```sh
   terraform plan
   ```
4. Apply the configuration:
   ```sh
   terraform apply
   ```

## Notes
- Update `terraform.tfvars` and variables as needed for your environment.
- State files are managed per workspace in the `terraform.tfstate.d/` directory. 