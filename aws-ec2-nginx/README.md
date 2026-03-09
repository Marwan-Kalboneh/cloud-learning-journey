

# AWS EC2 Ubuntu Web Server Deployment

## About this project

This is one of my first AWS projects.

The idea was simple: launch an Ubuntu server on AWS, connect to it with SSH, install Nginx, and make a basic website open in the browser using the public IP.

I did this project to understand how a real cloud VM works and how a web server can be deployed on it.

---

## What I used

- AWS EC2
- Ubuntu 22.04
- Nginx
- SSH
- Security Groups

---

## Instance details

- Instance type: t3.micro
- OS: Ubuntu 22.04 LTS
- Access: SSH with key pair
- Open ports:
  - 22 for SSH
  - 80 for HTTP

---

## Steps I did

### 1) Created the EC2 instance
I selected Ubuntu 22.04 LTS, chose t3.micro, enabled public IP, and created a key pair file to connect to the server.

### 2) Connected with SSH
Before connecting, I changed the permission of the key file:

```bash
chmod 600 cloud-key.pem
ssh -i cloud-key.pem ubuntu@<public-ip>

