# Cloud Learning Journey

This repository contains my cloud, DevOps, and infrastructure learning projects.

I started with basic EC2 and Nginx deployments, then moved into Terraform, Docker, ECR, GitHub Actions, ECS Fargate, and Kubernetes.

The main goal of this repository is to show practical hands-on progress, not just theory.

## Featured Projects

### 1. Project 10 - Kubernetes Deployment Platform

Local Kubernetes deployment using kind, kubectl, Docker, Ingress, PostgreSQL, Helm, and GitHub Actions validation.

Folder:

```text
project10-kubernetes-deployment-platform
```

Main things covered:

- Kubernetes Deployments
- Services
- Ingress
- ConfigMaps
- Secrets
- PersistentVolumeClaim
- Readiness and liveness probes
- Helm install and upgrade
- GitHub Actions validation with a temporary kind cluster

[Open Project 10](./project10-kubernetes-deployment-platform)

---

### 2. Project 9 - ECS Fargate Production App

Production-style AWS container deployment using ECS Fargate, ECR, ALB, CloudWatch, Terraform, IAM/OIDC, and GitHub Actions CI/CD.

Folder:

```text
project9-ecs-fargate-production-app
```

Main things covered:

- Frontend and backend containers
- Amazon ECR
- ECS Fargate services
- Application Load Balancer routing
- CloudWatch logs
- Terraform-managed infrastructure
- GitHub Actions CI/CD

[Open Project 9](./project9-ecs-fargate-production-app)

---

### 3. Project 8 - Full CI/CD Deployment on EC2

Full CI/CD pipeline where GitHub Actions builds a Docker image, pushes it to ECR, SSHs into EC2, pulls the new image, and redeploys the container.

Folder:

```text
project8-full-cicd-deploy
```

Main things covered:

- Terraform
- EC2
- Docker
- ECR
- GitHub Actions
- AWS OIDC
- SSH-based deployment
- Automated container redeployment

[Open Project 8](./project8-full-cicd-deploy)

---

## Full Project List

| Project | Folder | Main focus |
|---|---|---|
| Project 10 | project10-kubernetes-deployment-platform | Kubernetes, Helm, Ingress, GitHub Actions validation |
| Project 9 | project9-ecs-fargate-production-app | ECS Fargate, ALB, ECR, Terraform, CI/CD |
| Project 8 | project8-full-cicd-deploy | EC2 Docker CI/CD with GitHub Actions and ECR |
| Project 7 | github-actions-ecr-cicd | GitHub Actions building and pushing Docker images to ECR |
| Project 6 | terraform-vpc-docker-nginx | Custom VPC, subnet, routing, EC2, Docker |
| Project 5 | terraform-ecr-nginx | ECR image deployment to EC2 |
| Project 4 | terraform-custom-docker-nginx | Custom Docker image with Nginx |
| Project 3 | terraform-docker-nginx | Dockerized Nginx on EC2 |
| Project 2 | terraform-nginx | Terraform EC2 and Nginx |
| Project 1 | aws-ec2-nginx | Manual EC2 and Nginx setup |

## Skills Practiced

- AWS EC2
- Amazon ECR
- ECS Fargate
- Application Load Balancer
- IAM roles and policies
- GitHub Actions
- GitHub OIDC authentication
- Terraform
- Docker
- Docker Compose
- Kubernetes
- kind
- kubectl
- Helm
- Nginx
- FastAPI
- PostgreSQL
- Linux / WSL Ubuntu
- Basic cloud networking

## Notes

Some older projects are simpler and were built earlier in the learning process.

The strongest projects are:

1. Project 10 - Kubernetes Deployment Platform
2. Project 9 - ECS Fargate Production App
3. Project 8 - Full CI/CD Deployment on EC2

These are the projects I would mainly discuss for cloud, DevOps, infrastructure, or platform engineering internship applications.

## Current Status

- Project 8 completed and documented
- Project 9 completed and documented
- Project 10 completed and documented
- GitHub Actions validation added for Project 10
- AWS resources from Project 8 and Project 9 were destroyed after saving proof to avoid ongoing cost

## Next Improvements

Possible next steps:

- Clean up older project READMEs
- Add better screenshots to older projects
- Add CV-ready project bullets
- Add a short architecture diagram for the strongest projects
- Later: extend Project 10 to AWS EKS
