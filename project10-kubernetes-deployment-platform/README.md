# Project 10 - Kubernetes Deployment Platform

This project deploys a multi-container application on Kubernetes using a local `kind` cluster.

The application includes:

- Frontend container using Nginx
- Backend API using FastAPI
- PostgreSQL database
- Kubernetes Deployments
- Kubernetes Services
- Ingress routing
- ConfigMap and Secret
- PersistentVolumeClaim for database storage
- Readiness and liveness probes
- Helm chart deployment
- GitHub Actions validation workflow

## Goal

The goal of this project was to move from Docker Compose and ECS-style deployments into Kubernetes.

Instead of only running containers manually, this project shows how an application can be deployed and managed using Kubernetes objects such as Pods, Deployments, Services, Ingress, ConfigMaps, Secrets, PersistentVolumeClaims, probes, and Helm.

## Architecture

```text
Browser / curl
        ↓
Kubernetes Ingress
        ↓
Frontend Service
        ↓
Frontend Pod
        ↓
Backend Service
        ↓
Backend Pod
        ↓
PostgreSQL Service
        ↓
PostgreSQL Pod
        ↓
PersistentVolumeClaim
```

## Technologies Used

- Kubernetes
- kind
- kubectl
- Docker
- Nginx
- FastAPI
- PostgreSQL
- Helm
- GitHub Actions
- WSL Ubuntu

## Main Features

- Created a local Kubernetes cluster using kind
- Built frontend and backend Docker images locally
- Loaded local Docker images into the kind cluster
- Deployed frontend, backend, and PostgreSQL using Kubernetes manifests
- Used Kubernetes Services for internal communication
- Used Ingress to expose the app on `localhost:8081`
- Connected the backend to PostgreSQL inside the cluster
- Added tasks from the browser and stored them in PostgreSQL
- Added readiness and liveness probes
- Created a Helm chart for cleaner deployment
- Used Helm upgrade to scale frontend replicas
- Added a GitHub Actions workflow to validate Kubernetes and Helm configuration

## Project Structure

```text
project10-kubernetes-deployment-platform/
├── backend/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── app/
│       ├── __init__.py
│       └── main.py
├── frontend/
│   ├── Dockerfile
│   └── index.html
├── helm/
│   └── project10/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
├── k8s/
│   ├── namespace.yaml
│   ├── configmap.yaml
│   ├── secret.yaml
│   ├── postgres-pvc.yaml
│   ├── postgres-deployment.yaml
│   ├── postgres-service.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   └── ingress.yaml
├── screenshots/
├── kind-config.yaml
└── README.md
```

## Local Kubernetes Setup

Create the kind cluster:

```bash
kind create cluster --config kind-config.yaml
```

Check the cluster:

```bash
kubectl get nodes
```

Build Docker images:

```bash
docker build -t project10-backend:latest ./backend
docker build -t project10-frontend:latest ./frontend
```

Load images into kind:

```bash
kind load docker-image project10-backend:latest --name project10
kind load docker-image project10-frontend:latest --name project10
```

Apply Kubernetes manifests:

```bash
kubectl apply -f k8s/
```

Check resources:

```bash
kubectl get pods -n project10
kubectl get svc -n project10
kubectl get ingress -n project10
```

Test backend health through Ingress:

```bash
curl http://localhost:8081/api/health
```

Expected result:

```json
{"status":"healthy","database":"connected"}
```

Test stored tasks:

```bash
curl http://localhost:8081/api/tasks
```

Example result:

```json
[{"id":1,"title":"eat"}]
```

## Helm Deployment

The project also includes a Helm chart.

Install the app with Helm:

```bash
helm install project10 ./helm/project10 --namespace project10 --create-namespace
```

Check Helm release:

```bash
helm list -n project10
```

Upgrade the deployment and scale the frontend:

```bash
helm upgrade project10 ./helm/project10 -n project10 --set frontend.replicas=2
```

Check pods:

```bash
kubectl get pods -n project10
```

## GitHub Actions Validation

The project includes a GitHub Actions workflow that validates the Kubernetes configuration.

The workflow does the following:

- Installs Helm
- Installs kubectl
- Installs kind
- Creates a temporary Kubernetes cluster
- Runs Helm lint
- Renders Helm templates
- Runs Kubernetes dry-run validation
- Runs Helm dry-run install

Workflow file:

```text
.github/workflows/project10-kubernetes-validation.yml
```

## Screenshots

### Docker images built

![Docker images built](screenshots/01-docker-images-built.png)

### Ingress created

![Ingress created](screenshots/02-ingress-created.png)

### API health through Ingress

![API health through Ingress](screenshots/03-api-health-through-ingress.png)

### Application running in browser

![Application running in browser](screenshots/04-app-running-in-browser.png)

### API tasks through Ingress

![API tasks through Ingress](screenshots/05-api-tasks-through-ingress.png)

### Backend logs

![Backend logs](screenshots/06-kubectl-logs-backend.png)

### Backend pod describe and probes

![Backend pod describe and probes](screenshots/07-backend-pod-describe-probes.png)

### Kubernetes resources running

![Kubernetes resources running](screenshots/08-kubernetes-all-resources-running.png)

### Helm upgrade success

![Helm upgrade success](screenshots/09-helm-upgrade-success.png)

### GitHub Actions validation failed before fix

![GitHub Actions validation failed before fix](screenshots/10-github-actions-validation-failed-before-fix.png)

### GitHub Actions validation success

![GitHub Actions validation success](screenshots/11-github-actions-validation-success.png)

## Problems Faced and Fixed

### kubectl was not installed

At the start, `kubectl` was missing in WSL, so it was installed using the Kubernetes apt repository.

### kind was not installed

`kind` was also missing, so it was installed manually using the Linux binary.

### Frontend file was accidentally overwritten incorrectly

The frontend `index.html` was accidentally mixed with Dockerfile content. It was fixed by overwriting the frontend files cleanly.

### Namespace error during kubectl apply

Some resources failed during the first `kubectl apply` because the namespace had just been created. Running `kubectl apply -f k8s/` again fixed it.

### Backend restarted before PostgreSQL was ready

The backend temporarily entered restart/backoff because PostgreSQL was still starting. After PostgreSQL became ready, the backend recovered and stayed running.

### GitHub Actions failed first

The first workflow failed because GitHub Actions did not have a Kubernetes cluster available. The fix was to create a temporary kind cluster inside the workflow before running validation.

## What I Learned

In this project, I learned how Kubernetes manages containers differently from Docker Compose and ECS.

Important concepts practiced:

- A Pod runs containers
- A Deployment keeps the desired number of Pods running
- A Service gives stable networking to Pods
- Ingress exposes HTTP traffic into the cluster
- ConfigMaps store non-secret configuration
- Secrets store sensitive configuration
- PVCs request persistent storage
- Readiness probes decide when a Pod can receive traffic
- Liveness probes decide when Kubernetes should restart a container
- Helm packages Kubernetes YAML into a reusable chart
- GitHub Actions can validate Kubernetes configuration before deployment

## Future Improvements

Possible next steps:

- Deploy the same app to AWS EKS
- Push images to Amazon ECR
- Use AWS Load Balancer Controller
- Add HTTPS with a certificate
- Add automated backend tests
- Use separate dev and prod Helm values
- Add monitoring and alerts
- Replace local PostgreSQL with managed RDS in a cloud deployment

## Project Summary

This project demonstrates a complete local Kubernetes deployment workflow for a frontend, backend, and database application.

It includes Kubernetes manifests, Ingress routing, persistent database storage, health probes, Helm deployment, Helm upgrade, and GitHub Actions validation.
