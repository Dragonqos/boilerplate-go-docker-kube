# boilerplate-go-docker-kube


## DockerHub
- Register on hub.docker.com
- Create repoistory
  ex: "gosample"
- login to DockerHub from console `docker login -u=myusername`
- run `make build` to build application image
- run `make push` to push image to DockerHub

## Kubernetes

### Install kubectl + minikube

Kubectl - is a command line tool to manage kubernetes cluster (ESC, GCP, DO, Minikube, etc...)
Minikube - is a Kubernetes cluster manager that allows to run Kubernetes on local machine

https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
https://kubernetes.io/ru/docs/tasks/tools/install-minikube/

### 
kubectl create ns 
