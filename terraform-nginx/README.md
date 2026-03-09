# Terraform AWS Nginx Server

## About

This project is the Terraform version of my earlier AWS EC2 + Nginx project.

In the first project, I created the server manually from the AWS Console. In this one, I used Terraform to create the EC2 instance, security group, and install Nginx automatically.

## What it does

 creates a security group
- opens port 22 for SSH
- opens port 80 for HTTP
- launches an EC2 instance
- installs Nginx with user_data
- shows the public IP as output

## Commands used

```bash
terraform init
terraform plan
terraform apply
terraform destroy
