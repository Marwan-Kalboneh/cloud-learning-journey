# AWS EC2 Ubuntu Web Server Deployment

## Overview
Deployed a public Linux web server on AWS EC2 using Ubuntu 22.04 and Nginx.  
Configured SSH access, security groups, and served a custom static website over HTTP.

---

## Infrastructure

- AWS EC2 (t3.micro – Free Tier)
- Ubuntu Server 22.04 LTS
- Nginx
- SSH key-based authentication
- Security Groups (Port 22 for SSH, Port 80 for HTTP)

---

## Deployment Steps

### 1. Launch EC2 Instance
- Selected Ubuntu 22.04 LTS
- Instance type: t3.micro
- Enabled auto-assign public IP
- Created and downloaded key pair (.pem)

### 2. Connect via SSH
```bash
chmod 600 cloud-key.pem
ssh -i cloud-key.pem ubuntu@<public-ip>
