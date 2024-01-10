# Terraform AWS Dev Environment

## Overview

This project allows us to create a fully customizable development environment in AWS using Terraform - an IaC tool (Infrastructure as Code). It provisions a set of resources that can help developers quickly spin up and configure resources required for their development work, ensuring consistency and reproducibility across environments.

## Features

- Creates a VPC with customizable CIDR blocks, subnets, routing configurations, and IGW
- Sets up security groups to control inbound and outbound traffic
- Deploys EC2 instances based on the specified AMI, with customizable instance types and user data
- Sets up IAM roles and policies for secure access to AWS services
- Sample codes for config files, dynamic config with tf variables
- Supports customizable tags for resource categorization

## Prerequisites

- AWS account with appropriate permissions
- Terraform v1.0.8 or later installed on your local machine
- AWS CLI configured with appropriate credentials
- VS Code and AWS Tootlkit  
- Basic understanding of Terraform and AWS services

## Project Architecture

![architectural-diagram drawio](https://github.com/Lizz1102/terraform-aws-dev-environment/assets/15815335/f26d4be8-24af-4b4b-b3f9-14fde4e3aeb1) 

## How to use this project and deploy using VS Code 


1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Lizz1102/terraform-aws-dev-environment.git

2. Open a terminal in the project directory, run terraform init initialize the project and download the necessary provider plugins
   ```bash
   terraform init

3. Modify the Terraform configuration file - main.tf as needed. Run terraform plan to see a preview of the changes Terraform will make
   ```bash
   terraform plan

4. Review the plan to ensure it aligns with your expectations and run terraform apply apply them 
   ```bash
   terraform plan

5. Run terraform destroy to destroy all the resources created by Terraform
   ```bash
   terraform destroy

## Contact
For any questions or inquiries, you can reach out to the author of this project at lizz05110@gmail.com

## Acknowledgements
Resources that helped me while building this project are -
- https://www.linkedin.com/in/derekm1215/
- https://www.freecodecamp.org/ 
- https://www.terraform.io/ 

