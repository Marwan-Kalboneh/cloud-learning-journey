# Terraform Custom Docker Nginx Server

## About

This project is the next step after my Terraform EC2 + Docker + Nginx project.

In the previous project, I used Terraform to create the EC2 instance and security group, then used `user_data` to install Docker automatically and run the default Nginx container.

In this project, I went one step further by building a custom Docker image based on Nginx and serving my own HTML page instead of the default Nginx welcome page.

The main goal of this project was to understand the difference between running a ready-made Docker image and building my own image with custom content.

## What it does

This project:
- creates a security group
- opens port 22 for SSH
- opens port 80 for HTTP
- launches an EC2 instance
- installs Docker automatically with `user_data`
- creates a custom `index.html`
- creates a `Dockerfile`
- builds a custom Docker image
- runs the custom Nginx container
- shows the public IP and website URL as outputs

## Files

- `main.tf`
- `variables.tf`
- `outputs.tf`
- `README.md`

## Commands used
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

## Result

> After running `terraform apply`, Terraform created the EC2 instance and security group and returned the public IP and website URL. The EC2 instance then ran the `user_data` script automatically, which installed Docker, created the custom website files, built the Docker image, and launched the container.

I tested the deployment in four ways:
- opened the public IP in the browser and saw my custom page
- used `sudo docker ps` to confirm the container was running
- used `sudo docker images` to confirm the custom image was built
- used `curl localhost` on the EC2 instance to confirm the server was serving the page locally

## What I learned

> This project helped me understand how to go beyond just running containers and start building and serving my own content with Docker and Terraform.

- how to build a custom Docker image based on Nginx
- the difference between running the default Nginx image and serving my own custom page
- how `user_data` can automate both infrastructure setup and deployment steps
- why port 80 must be open in the security group
- why Docker port mapping is needed
- how Terraform can automate both infrastructure and application setup

## Screenshots

### Terraform apply
![Terraform apply](Screenshots/terraform%20apply.PNG)

### Custom page live
![Custom page](Screenshots/custome%20page.PNG)

### Docker images
![Docker images](Screenshots/docker%20images.PNG)

### Docker container running
![Docker container running](Screenshots/docker%20ps.PNG)

### Local test from EC2
![curl localhost](Screenshots/curl%20localhost.PNG)
