# 🚀 End-to-End DevOps Pipeline with Kubernetes

This project demonstrates a complete DevOps workflow where a simple Flask application is containerized, automated using CI/CD, and deployed on Kubernetes.

Instead of only following steps, I built this project by debugging real issues and understanding each layer deeply.

---

## 🧠 What this project covers

- Building a Flask application
- Dockerizing the application
- Automating build and push using GitHub Actions
- Deploying on Kubernetes using Minikube
- Exposing the application using NodePort
- Scaling pods dynamically
- Debugging deployment and image version issues

---

## 🏗️ Architecture

```text
Flask App → Docker → GitHub Actions → Docker Hub → Kubernetes → Browser
```

---

## 📅 Progress Breakdown

### 📍 Day 1 – Application Setup
- Created Flask application
- Added version endpoint
- Structured project folders

---

### 📍 Day 2 – Dockerization
- Created Dockerfile
- Built Docker image
- Ran container locally

```bash
docker build -t flask-app:v1 .
docker run -d -p 5000:5000 flask-app:v1
```

---

### 📍 Day 3 – Kubernetes Deployment
- Created Deployment and Service YAML files
- Deployed application on Minikube
- Exposed application using NodePort
- Tested scaling

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get svc
kubectl scale deployment flask-app --replicas=4
```

---

### 📍 Day 4 – CI/CD Pipeline
- Created GitHub Actions workflow
- Automated Docker build and push process
- Connected Docker Hub with GitHub secrets

---

### 📍 Day 5 – Deployment Debugging & Version Upgrade
- Worked on image version upgrade (`v1 → v2`)
- Solved Kubernetes image caching issue
- Updated deployment with new image version
- Restarted pods successfully

---

## 🐳 Docker Commands Used

```bash
docker build -t flask-app:v1 .
docker run -d -p 5000:5000 flask-app:v1
docker build -t flask-app:v2 .
```

---

## ☸️ Kubernetes Commands Used

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get pods
kubectl get svc
kubectl delete pods --all
kubectl rollout restart deployment flask-app
minikube service flask-service
```

---

## 📸 Project Output

### Kubernetes Pods Running
![Pods Output](pods-output.png)

---

## ⚠️ Key Learnings

- `latest` image tag can create caching issues
- Kubernetes deployment updates require image version changes
- GitHub Actions cannot directly deploy to local Minikube
- Debugging with `kubectl logs` and `kubectl describe` is essential
- Real learning comes from solving deployment errors

---

## 💡 Final Note

This project helped me understand the real DevOps workflow from application development to deployment and debugging.

The most valuable learning was not only building the pipeline but understanding how to fix issues when the system breaks.