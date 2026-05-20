# Cloud Learning Journey

This repository contains my hands-on cloud, DevOps, and infrastructure projects.

I started with basic EC2 and Nginx deployments, then moved into Terraform, Docker, Amazon ECR, GitHub Actions, ECS Fargate, and Kubernetes.

The goal of this repository is to show practical progress through real deployments, automation, and infrastructure work.

## Featured Projects

### Kubernetes Deployment Platform

A local Kubernetes deployment of a frontend, backend, and PostgreSQL application using kind, kubectl, Ingress, Helm, and GitHub Actions validation.

Main things covered:

- Kubernetes Deployments
- Services
- Ingress
- ConfigMaps
- Secrets
- PersistentVolumeClaim
- Readiness and liveness probes
- Helm install and upgrade
- GitHub Actions validation using a temporary kind cluster

[Open project](./project10-kubernetes-deployment-platform)

---

### ECS Fargate Production App

A production-style AWS container deployment using ECS Fargate, Amazon ECR, Application Load Balancer, CloudWatch, Terraform, IAM/OIDC, and GitHub Actions CI/CD.

Main things covered:

- Frontend and backend containers
- Amazon ECR
- ECS Fargate services
- Application Load Balancer routing
- CloudWatch logs
- Terraform-managed infrastructure
- GitHub Actions CI/CD

[Open project](./project9-ecs-fargate-production-app)

---

### EC2 Full CI/CD Deployment

A CI/CD pipeline where GitHub Actions builds a Docker image, pushes it to Amazon ECR, connects to EC2, pulls the latest image, and redeploys the running container.

Main things covered:

- Terraform
- EC2
- Docker
- Amazon ECR
- GitHub Actions
- AWS OIDC
- SSH-based deployment
- Automated container redeployment

[Open project](./project8-full-cicd-deploy)

---

## Other Projects

| Project | Main focus | Link |
|---|---|---|
| GitHub Actions to ECR Pipeline | GitHub Actions building and pushing Docker images to ECR | [Open](./github-actions-ecr-cicd) |
| Custom VPC Docker Deployment | VPC, subnet, routing, EC2, and Docker | [Open](./terraform-vpc-docker-nginx) |
| ECR Image Deployment to EC2 | Docker image pushed to ECR and pulled by EC2 | [Open](./terraform-ecr-nginx) |
| Custom Docker Image Deployment | Custom Nginx image built with Dockerfile | [Open](./terraform-custom-docker-nginx) |
| Dockerized Nginx on EC2 | Docker container running Nginx on EC2 | [Open](./terraform-docker-nginx) |
| Terraform EC2 and Nginx | EC2 and Nginx created with Terraform | [Open](./terraform-nginx) |
| Manual EC2 and Nginx | Basic manual EC2 setup with Nginx | [Open](./aws-ec2-nginx) |

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

The older projects are simpler because they were built earlier in the learning process.

The strongest projects in this repository are:

- Kubernetes Deployment Platform
- ECS Fargate Production App
- EC2 Full CI/CD Deployment

These are the main projects I would discuss for cloud, DevOps, infrastructure, or platform engineering internship applications.

## Current Status

- EC2 CI/CD project completed and documented
- ECS Fargate project completed and documented
- Kubernetes project completed and documented
- GitHub Actions validation added for the Kubernetes project
- AWS resources from the AWS projects were destroyed after saving proof to avoid ongoing cost

## Next Improvements

Possible next steps:

- Clean up older project READMEs
- Add better screenshots to older projects
- Add CV-ready project bullets
- Add simple architecture diagrams for the strongest projects
- Later: extend the Kubernetes project to AWS EKS
