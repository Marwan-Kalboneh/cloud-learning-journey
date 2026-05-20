# Cloud / DevOps Projects

This repository contains cloud and DevOps projects I built while learning AWS, Terraform, Docker, CI/CD, ECS, and Kubernetes.

The projects start with simple EC2 deployments and move toward more complete deployment workflows using containers, infrastructure as code, automation, and Kubernetes.

Each main project has its own README, screenshots, and setup files.

## Main Projects

### Kubernetes Deployment Platform

A local Kubernetes deployment for a small frontend, backend, and PostgreSQL application.

The app runs inside a local kind cluster. The frontend is served with Nginx, the backend is built with FastAPI, and PostgreSQL runs inside the cluster with persistent storage.

The project also includes a Helm chart and a GitHub Actions workflow that validates the Kubernetes configuration.

Main work done:

- Created a local Kubernetes cluster with kind
- Built frontend and backend Docker images
- Loaded local Docker images into the kind cluster
- Deployed frontend, backend, and PostgreSQL with Kubernetes YAML files
- Used Services for internal communication between containers
- Used Ingress to expose the app through localhost
- Added ConfigMap and Secret for application configuration
- Added a PersistentVolumeClaim for PostgreSQL storage
- Added readiness and liveness probes
- Created a Helm chart for the deployment
- Tested Helm install and Helm upgrade
- Added GitHub Actions validation using a temporary kind cluster

Tools used:

- Kubernetes
- kind
- kubectl
- Docker
- Nginx
- FastAPI
- PostgreSQL
- Helm
- GitHub Actions

[Open project](./project10-kubernetes-deployment-platform)

---

### ECS Fargate App Deployment

A production-style AWS container deployment using ECS Fargate.

This project deploys a frontend and backend container to AWS using ECS Fargate. The containers are stored in Amazon ECR, traffic is routed through an Application Load Balancer, and the infrastructure is managed with Terraform.

GitHub Actions is used to build and push the Docker images, then trigger a new ECS deployment.

Main work done:

- Built frontend and backend Docker images
- Created ECR repositories for the images
- Created ECS Fargate services
- Added an Application Load Balancer
- Used path-based routing for frontend and backend traffic
- Added CloudWatch logs for the containers
- Managed the AWS infrastructure with Terraform
- Used IAM roles and OIDC for GitHub Actions authentication
- Created a CI/CD workflow for image build, push, and ECS redeployment

Tools used:

- AWS ECS Fargate
- Amazon ECR
- Application Load Balancer
- CloudWatch
- Terraform
- Docker
- GitHub Actions
- IAM / OIDC

[Open project](./project9-ecs-fargate-production-app)

---

### EC2 Docker CI/CD Deployment

A CI/CD deployment pipeline for a Dockerized web app running on EC2.

GitHub Actions builds a Docker image, pushes it to Amazon ECR, connects to an EC2 instance through SSH, pulls the latest image, stops the old container, and starts the new one.

Main work done:

- Created AWS infrastructure with Terraform
- Created an EC2 instance for the app
- Created an ECR repository for the Docker image
- Built and pushed Docker images from GitHub Actions
- Used GitHub OIDC for AWS authentication
- Used SSH deployment to update the running EC2 container
- Automated container stop, remove, pull, and restart steps

Tools used:

- AWS EC2
- Amazon ECR
- Terraform
- Docker
- GitHub Actions
- SSH
- IAM / OIDC

[Open project](./project8-full-cicd-deploy)

---

## Other Projects

| Project | Focus | Link |
|---|---|---|
| GitHub Actions to ECR | Building and pushing Docker images to Amazon ECR from GitHub Actions | [Open](./github-actions-ecr-cicd) |
| Custom VPC Docker Deployment | Creating a custom VPC, subnet, route table, EC2 instance, and Docker deployment | [Open](./terraform-vpc-docker-nginx) |
| ECR to EC2 Deployment | Pushing a Docker image to ECR and pulling it from EC2 | [Open](./terraform-ecr-nginx) |
| Custom Docker Image | Building and running a custom Nginx Docker image | [Open](./terraform-custom-docker-nginx) |
| Dockerized Nginx on EC2 | Running Nginx as a Docker container on EC2 | [Open](./terraform-docker-nginx) |
| Terraform EC2 Nginx | Creating EC2 and installing Nginx with Terraform | [Open](./terraform-nginx) |
| Manual EC2 Nginx | Basic manual EC2 setup with Nginx | [Open](./aws-ec2-nginx) |

## Tools and Topics Covered

AWS:

- EC2
- ECR
- ECS Fargate
- Application Load Balancer
- IAM roles and policies
- CloudWatch logs
- Basic VPC networking

Infrastructure and automation:

- Terraform
- GitHub Actions
- GitHub OIDC authentication
- CI/CD pipelines
- SSH-based deployment

Containers:

- Docker
- Dockerfiles
- Docker Compose
- Container image build and push workflow

Kubernetes:

- kind
- kubectl
- Deployments
- Services
- Ingress
- ConfigMaps
- Secrets
- PersistentVolumeClaims
- Readiness and liveness probes
- Helm charts

Application stack used in projects:

- Nginx
- FastAPI
- PostgreSQL
- Linux / WSL Ubuntu
