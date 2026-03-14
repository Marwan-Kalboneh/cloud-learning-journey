# Terraform Custom Docker Nginx Server

## About

This project builds on my previous Terraform EC2 + Docker + Nginx project.

In the last one I was just running the default Nginx container. This time I 
went a step further and built my own Docker image to serve a custom HTML page 
instead. I wanted to understand what it actually takes to go from running a 
ready-made image to building and serving your own content.

## What it does

- Creates a security group with ports 22 and 80 open
- Launches an EC2 instance
- Uses user_data to automatically install Docker on the instance
- Creates a custom Dockerfile and index.html on the instance
- Builds the Docker image and runs the container
- Outputs the public IP and website URL

## Files

- main.tf
- variables.tf
- outputs.tf
- README.md


## Result

Once terraform apply finished, the EC2 instance started and the user_data 
script ran automatically. It installed Docker, created the Dockerfile and 
HTML file, built the image, and launched the container — no manual steps needed.

To confirm everything worked I tested it a few ways:

- Opened the public IP in the browser and saw the custom page
- Ran sudo docker ps to confirm the container was running
- Ran sudo docker images to confirm the image was built successfully
- Ran curl localhost on the EC2 instance to test it was serving locally

## What I learned

- How to write a Dockerfile and build a custom image
- The difference between pulling a default image and building your own
- How user_data can automate the full setup, not just the infrastructure part
- Why port 80 needs to be open and how Docker port mapping works

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
