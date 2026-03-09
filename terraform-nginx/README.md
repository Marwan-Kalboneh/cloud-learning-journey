# Terraform AWS Nginx Server

## About

This project is the Terraform version of my earlier AWS EC2 + Nginx project.

In my first AWS project, I created the server manually from the AWS Console. In this one, I used Terraform to create the EC2 instance and security group, and to automate the Nginx setup.

The main goal was to understand the basic Terraform workflow and see how the same infrastructure can be created from code instead of manually.

## What it does

This project:

- creates a security group
- opens port 22 for SSH
- opens port 80 for HTTP
- launches an EC2 instance
- installs Nginx automatically with "user_data"
- shows the public IP as output

## Files

- "main.tf"
- "outputs.tf"
- "README.md"

## Commands used

```bash
terraform init
terraform plan
terraform apply
terraform destroy

Result

After running terraform apply, Terraform created the infrastructure and returned the public IP.

I then opened the IP in the browser and checked that the website was working.

After testing, I used terraform destroy to remove the resources.

What I learned:

1-the basic Terraform workflow

2-how Terraform can be used with AWS

3-how to create EC2 instances and security groups from code

4-how user_data can automate server setup

5-the difference between manual deployment and Infrastructure as Code
