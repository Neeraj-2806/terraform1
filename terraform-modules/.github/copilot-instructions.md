# Terraform Module AI Coding Guidelines

## Architecture Overview
This is a modular Terraform configuration for AWS infrastructure deployed to `ap-south-1`. The project uses a **two-module pattern**:
- **VPC Module** (`modules/vpc/`): Manages core networking with CIDR block configuration and environment tagging
- **EC2 Module** (`modules/ec2/`): Manages compute instances with configurable instance types

**Key Cross-Module Pattern**: Both modules accept `env` variable to enable environment-specific deployments (dev/staging/prod) with consistent tagging and resource naming.

## File Organization Conventions
- `provider.tf`: Root-level AWS provider configuration (region fixed at ap-south-1)
- Each module follows the canonical three-file pattern:
  - `main.tf`: Resource definitions
  - `variables.tf`: Input variable declarations with descriptions
  - `outputs.tf`: Exported values for module consumers

## Critical Patterns & Practices

### Variable Declarations
- Always include `description` attribute for variable documentation (see `vpc/variables.tf` examples)
- Common pattern: Use `env` variable as a prefix in resource tags: `"${var.env}-vpc"`
- Instance type and CIDR blocks exposed as input variables for flexibility

### Resource Naming
- Use module-specific resource names: `aws_vpc.module-vpc`, `aws_instance.module_ec2`
- Tag resources with environment context for multi-environment deployments

### Outputs
- VPC module exports `vpc_id` for downstream consumption (e.g., subnet and security group creation)
- EC2 module outputs are currently incomplete (empty `outputs.tf`) - add `instance_id` and `instance_dns` when extending

## Development Workflow

**Validation**: Run `terraform validate` after changes to syntax and configuration
```bash
terraform validate
```

**Planning**: Preview infrastructure changes before applying
```bash
terraform plan
```

**AMI Management**: EC2 module hardcodes AMI `ami-019715e0d74f695be` (Amazon Linux 2 equivalent in ap-south-1). Update when using different regions or image families.

## Common Extension Points
- **VPC Subnets**: Parameterize subnet count/configuration in vpc/variables.tf
- **Security Groups**: Add sg variable to EC2 module for network access control
- **Output Dependencies**: Link EC2 instances to VPC subnet IDs via variable inputs
- **Tagging Strategy**: Consider centralized tagging policy (project, owner, cost-center tags beyond env)
