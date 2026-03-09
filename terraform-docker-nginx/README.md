# Terraform Docker Nginx Server

## About

This project is the next step after my Terraform EC2 + Nginx project.

In the previous project, Nginx was installed directly on the Ubuntu server. In this one, I used Terraform to create the EC2 instance and security group, then used user_data to install Docker automatically and run Nginx inside a container.

The main goal of this project was to understand the difference between installing software directly on a virtual machine and running it in Docker.

## What it does

This project:

- creates a security group
- opens port 22 for SSH
- opens port 80 for HTTP
- launches an EC2 instance
- installs Docker automatically with user_data
- runs an Nginx container
- shows the public IP as output

## Files

- main.tf
- outputs.tf
- README.md

## Commands used

terraform init  
terraform plan  
terraform apply  
terraform destroy

## Result

After running terraform apply, Terraform created the EC2 instance and security group and returned the public IP.

The EC2 instance then ran the user_data script automatically, which installed Docker, started Docker, and launched an Nginx container.

I tested the deployment in three ways:

- opened the public IP in the browser and saw the default Nginx page
- used sudo docker ps to confirm the container was running
- used curl localhost on the EC2 instance to confirm the server was serving the page locally

## What I learned

- how Docker fits into a cloud deployment
- the difference between installing Nginx directly and running it in a container
- how user_data can automate server setup
- why port 80 must be open in the security group
- why Docker port mapping is needed
- how Terraform can automate both infrastructure and software setup




