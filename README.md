# Terraform AWS Dev Environment

## Overview

This project allows you to create a fully customizable development environment on AWS using Terraform - an IaC tool (Infrastructure as Code). It provisions a set of resources that can help developers quickly spin up and configure resources required for their development work, ensuring consistency and reproducibility across environments.

## Features

- Creates a VPC with customizable CIDR blocks, subnets, routing configurations, and IGW
- Sets up security groups to control inbound and outbound traffic
- Deploys EC2 instances based on the specified AMI, with customizable instance types and user data
- Sets up IAM roles and policies for secure access to AWS services
- Supports customizable tags for resource categorization

## Prerequisites

- AWS account with appropriate permissions
- Terraform v1.0.8 or later installed on your local machine
- AWS CLI configured with appropriate credentials
- VS Code and AWS Tootlkit  
- Basic understanding of Terraform and AWS services

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Lizz1102/terraform-aws-dev-environment.git
Navigate to the project directory:

bash
Copy code
cd terraform-aws-dev-environment
Customize the terraform.tfvars file to configure your desired settings:

hcl
Copy code
aws_region = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
# ... (other variables)
Initialize the Terraform project:

bash
Copy code
terraform init
Preview the changes that Terraform will apply:

bash
Copy code
terraform plan
Apply the infrastructure changes:

bash
Copy code
terraform apply
After provisioning, Terraform will output relevant information such as instance IPs and URLs.

When done, tear down the environment:

bash
Copy code
terraform destroy
License
This project is licensed under the MIT License.

Contributing
Contributions are welcome! Feel free to open an issue or pull request for any improvements or fixes.

Contact
For any questions or inquiries, you can reach out to the author of this project at lizz05110@gmail.com.

