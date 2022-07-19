GOPATH      		 := $(shell go env GOPATH)
APP_NAME    		 := gosample
SERVICE0_DOCKER_REPO := dragonqos/service0
SERVICE1_DOCKER_REPO := dragonqos/service1
SHELL      			 := /bin/bash
NOW         		 := $(shell date +'%Y.%m.%d')

login: ## Login to docker hub
	docker login

build-service0: ## Build service 0 the container
	docker build --rm --platform linux/amd64 -t $(SERVICE0_DOCKER_REPO):latest -t $(SERVICE0_DOCKER_REPO):$(NOW) ./service0

push-service0: ## Push docker image to DockerHub
	docker push $(SERVICE0_DOCKER_REPO)

deploy-service0: build-service0 login push-service0 ## Build image and push it on DockerHub


build-service1: ## Build service 1 the container
	docker build --rm --platform linux/amd64 -t $(SERVICE1_DOCKER_REPO):latest -t $(SERVICE1_DOCKER_REPO):$(NOW) ./service1

push-service1: ## Push docker image to DockerHub
	docker push $(SERVICE1_DOCKER_REPO)

deploy-service1: build-service1 login push-service1 ## Build image and push it on DockerHub


deploy: deploy-service0 deploy-service1 ## deploy all

.PHONY: help
help: ## http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
