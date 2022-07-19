# boilerplate-go-docker-kube


## DockerHub
- Register on hub.docker.com
- Create repoistory
  ex: "gosample"
- login to DockerHub from console `docker login -u=myusername`


---
## Kubernetes

### Install kubectl + minikube

First you need to setup Docker on your computer, and then enable Kubernetes cluster on it.

Kubectl - is a command line tool to manage kubernetes cluster (ESC, GCP, DO, Minikube, etc...)
Minikube - is a Kubernetes cluster manager that allows to run Kubernetes on local machine

- https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
- https://kubernetes.io/ru/docs/tasks/tools/install-minikube/
- run `minikube start` to create cluster
- run `minikube addons enable ingress` to enable ingress controller

### Make Docker build
- run `make build-goservice` to build application image
- run `make push-goservice` to push image to DockerHub
- run `make deploy-goservice` will do build login and then push all in one command

### Run application in minikube
- run `kubectl apply -f k8s/app-deployment.yaml`

### Drop application from minikube
- run `kubectl delete -f k8s/app-deployment.yaml`


---
## Skaffold 

### Install skaffold

Skaffold allows to simplify local development and automate k8s deployments.

- https://skaffold.dev/docs/install/