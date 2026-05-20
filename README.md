# Cloud / DevOps Projects

This repository contains cloud and DevOps projects I built while learning AWS, Terraform, Docker, CI/CD, ECS, and Kubernetes.

The projects start from simple EC2 deployments and move into more complete infrastructure and deployment workflows.

## Main Projects

### Kubernetes Deployment Platform

A local Kubernetes deployment for a small frontend, backend, and PostgreSQL app.

What it uses:

- Kubernetes
- kind
- kubectl
- Docker
- Ingress
- PostgreSQL
- Helm
- GitHub Actions validation

[Open project](./project10-kubernetes-deployment-platform)

---

### ECS Fargate App Deployment

A containerized AWS deployment using ECS Fargate, ECR, an Application Load Balancer, Terraform, and GitHub Actions.

What it uses:

- ECS Fargate
- Amazon ECR
- Application Load Balancer
- Terraform
- CloudWatch logs
- IAM and OIDC
- GitHub Actions CI/CD

[Open project](./project9-ecs-fargate-production-app)

---

### EC2 Docker CI/CD Deployment

A CI/CD pipeline that builds a Docker image, pushes it to ECR, connects to an EC2 instance, and redeploys the running container.

What it uses:

- EC2
- Docker
- Amazon ECR
- Terraform
- GitHub Actions
- SSH deployment
- AWS OIDC

[Open project](./project8-full-cicd-deploy)

---

## Other Projects

| Project | Focus | Link |
|---|---|---|
| GitHub Actions to ECR | Build and push Docker images to ECR from GitHub Actions | [Open](./github-actions-ecr-cicd) |
| VPC Docker Deployment | Custom VPC, subnet, routing, EC2, and Docker | [Open](./terraform-vpc-docker-nginx) |
| ECR to EC2 Deployment | Push image to ECR and pull it from EC2 | [Open](./terraform-ecr-nginx) |
| Custom Docker Image | Build and run a custom Nginx Docker image | [Open](./terraform-custom-docker-nginx) |
| Dockerized Nginx on EC2 | Run Nginx as a Docker container on EC2 | [Open](./terraform-docker-nginx) |
| Terraform EC2 Nginx | Create EC2 and install Nginx with Terraform | [Open](./terraform-nginx) |
| Manual EC2 Nginx | Basic manual EC2 setup with Nginx | [Open](./aws-ec2-nginx) |

## Tools and Topics

- AWS EC2
- Amazon ECR
- ECS Fargate
- Application Load Balancer
- IAM roles and policies
- Terraform
- Docker
- Docker Compose
- GitHub Actions
- Kubernetes
- kind
- kubectl
- Helm
- Nginx
- FastAPI
- PostgreSQL
- Linux / WSL
