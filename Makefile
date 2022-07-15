GOPATH      := $(shell go env GOPATH)
APP_NAME    := gosample
DOCKER_REPO := dragonqos/gosample
SHELL       := /bin/bash
NOW         := $(shell date +'%Y.%m.%d')

help: ## http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the container
	docker build --rm --platform linux/amd64 -t $(DOCKER_REPO):latest -t $(DOCKER_REPO):$(NOW) .

login: ## Login to docker hub
	docker login

push: ## Push docker image to DockerHub
	docker push $(DOCKER_REPO)

deploy: build login push ## Build image and push it on DockerHub


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
