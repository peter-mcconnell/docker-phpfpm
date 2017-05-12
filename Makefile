.PHONY: help deploy build test-run

PHPFOLDER?=php7.1
IMAGE?=pemcconnell/docker-phpfpm

help: ## shows all available targets
	@echo ""
	@echo "Docker ~ PHP + FPM"
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	@echo ""

deploy: build ## builds and pushes the locally taggged image to docker hub
	docker push ${IMAGE}:${TAG}

build: ## build and tag our image.
	@if [ "${TAG}" = "" ]; then \
	  echo "TAG not set, or blank"; \
	  exit 1; \
	fi;
	cd ${PHPFOLDER}; docker build -t ${IMAGE}:${TAG} .

test-run: build ## an example of this container running against a phpinfo() file
	docker run -p 9000:9000 -v $(CURDIR)/app:/app -ti ${IMAGE}:${TAG} php7 index.php

sh: build ## execute 'sh' inside the container
	docker run -p 9000:9000 -v $(CURDIR)/app:/app -ti ${IMAGE}:${TAG} sh
