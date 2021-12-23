DOCKER_IMAGE=cubetiq/calpine-node:14
build:
	@echo 'Starting docker build'
	docker build . -t ${DOCKER_IMAGE}

	@echo 'Starting docker push'
	docker tag ${DOCKER_IMAGE}
	docker push ${DOCKER_IMAGE}

.PHONY:build