# Terraform ECR Docker Nginx Server

## About

This project builds on my previous Terraform + Docker + Nginx setup.

In the last project, the Docker image was built directly on the EC2 instance using user_data.  
In this project, I wanted to take it one step further and follow a more realistic deployment flow.

Instead of building the image on the server, I:

- Built the Docker image locally
- Pushed it to Amazon ECR
- Let the EC2 instance pull and run the image automatically

This helped me understand how container registries fit into real deployments.

---

## What it does

- Creates an ECR repository using Terraform  
- Builds a custom Docker image locally  
- Pushes the image to Amazon ECR  
- Creates a security group with ports 22 and 80 open  
- Launches an EC2 instance  
- Uses user_data to automatically:
  - install Docker and AWS CLI  
  - authenticate to ECR  
  - pull the image  
  - run the container  
- Outputs the public IP and website URL  

---

## Files

- main.tf  
- variables.tf  
- outputs.tf  
- README.md  

---

## Result

Once terraform apply finished, the EC2 instance started and the user_data 
script ran automatically.

This time, instead of building the image on the instance, it:

- Logged into ECR using the IAM role  
- Pulled the Docker image from ECR  
- Started the container  

To confirm everything worked I tested it a few ways:

- Opened the public IP in the browser and saw the custom page  
- Ran sudo docker ps to confirm the container was running  
- Ran sudo docker images to confirm the image was pulled from ECR  
- Ran curl localhost on the EC2 instance to test it was serving locally  

---

## What I learned

- The difference between building locally vs building on the server  
- How Amazon ECR works as a container registry  
- How EC2 can access AWS services using IAM roles (no credentials needed)  
- How to push and pull Docker images from ECR  
- How real deployment flow is split into:
  - build stage  
  - registry stage  
  - runtime stage  

---

## Screenshots

### Terraform apply
![Terraform apply](Screenshots/terraform-apply-p5.png)

### ECR repository with image
![ECR repo](Screenshots/ecr-repo.png)

### Docker push to ECR
![Docker push](Screenshots/docker-push.png)

### Custom page live
![Custom page](Screenshots/browser-page.png)

### Docker container running on EC2
![Docker ps](Screenshots/docker-ps.png)

### Docker image pulled on EC2
![Docker images](Screenshots/docker-images.png)
