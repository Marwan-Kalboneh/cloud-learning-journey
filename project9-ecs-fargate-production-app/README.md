# Project 9 - Production-style ECS Deployment App

This project is a production-style cloud deployment project built as part of my cloud/devops learning journey.

The goal is to start with a local multi-container application and later deploy it to AWS ECS Fargate using Terraform, Docker, Amazon ECR, Application Load Balancer, CloudWatch, and GitHub Actions.

## Current Status

Phase 1 completed: local multi-container app running with Docker Compose.

## Local Architecture

Browser
→ Nginx frontend container
→ FastAPI backend container
→ PostgreSQL database container

## Technologies Used

- Docker
- Docker Compose
- Nginx
- FastAPI
- PostgreSQL
- Python
- Git/GitHub

## What This Phase Demonstrates

- Multi-container application setup
- Frontend container
- Backend API container
- PostgreSQL database container
- Docker Compose networking
- Nginx reverse proxy to backend API
- Environment variables for database connection
- Database health check
- Basic persistent database storage using Docker volumes

## Local Run Instructions

```bash
docker compose up --build
