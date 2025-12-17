# Holiday Shopping App - Terraform Infrastructure

This project sets up the infrastructure for a holiday shopping app using Terraform. The infrastructure is modularized into three components:

1. **Networking**: Creates a VPC and subnets.
2. **Load Balancing**: Sets up an Application Load Balancer.
3. **Compute**: Launches an EC2 instance.

## Folder Structure

- `modules/networking`: Contains resources for VPC and subnets.
- `modules/load_balancing`: Contains resources for the load balancer.
- `modules/compute`: Contains resources for the EC2 instance.
- `main.tf`: Root module to call the above modules.
- `variables.tf`: Defines input variables for the root module.
- `outputs.tf`: Defines output values for the root module.
- `versions.tf`: Specifies Terraform and provider versions.

## Prerequisites

- Terraform >= 1.14.2
- AWS CLI configured with appropriate credentials

## Usage

1. Initialize Terraform:
   ```
   terraform init
   ```

2. Plan the infrastructure:
   ```
   terraform plan
   ```

3. Apply the configuration:
   ```
   terraform apply
   ```

4. Destroy the infrastructure (if needed):
   ```
   terraform destroy
   ```

## Outputs

- `vpc_id`: ID of the created VPC.
- `load_balancer_dns`: DNS name of the load balancer.
- `instance_public_ip`: Public IP of the EC2 instance.

## Notes

- Replace placeholder values (e.g., AMI ID) with valid values for your AWS region.
- Ensure your AWS credentials are properly configured.

## License

This project is licensed under the MIT License.