DOCKER_REGISTRY := mathematiguy
IMAGE_NAME := $(shell basename `git rev-parse --show-toplevel` | tr '[:upper:]' '[:lower:]')
IMAGE := $(DOCKER_REGISTRY)/$(IMAGE_NAME)
RUN ?= 
PORT ?= 7396
DOCKER_ARGS ?= 
GIT_TAG ?= $(shell git log --oneline | head -n1 | awk '{print $$1}')

USERNAME ?= "Caleb_Moses"
TEAM ?= 11675 # PC Master Race
GPU ?= true
POWER ?= full
fold:
	docker run $(DOCKER_ARGS) --gpus all -it --rm -p $(PORT):$(PORT) $(IMAGE) --user=$(USER) --team=$(TEAM) --gpu=$(GPU) --smp=true --power=$(POWER)

.PHONY: docker
docker:
	docker build $(DOCKER_ARGS) --tag $(IMAGE):$(GIT_TAG) .
	docker tag $(IMAGE):$(GIT_TAG) $(IMAGE):latest

.PHONY: docker-push
docker-push:
	docker push $(IMAGE):$(GIT_TAG)
	docker push $(IMAGE):latest

.PHONY: docker-pull
docker-pull:
	docker pull $(IMAGE):$(GIT_TAG)
	docker tag $(IMAGE):$(GIT_TAG) $(IMAGE):latest
