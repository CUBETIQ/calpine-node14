DOCKER_IMAGE=cubetiq/calpine-node
DOCKER_IMAGE_GIT=cubetiq/calpine-node-git
DOCKER_IMAGE_NAME=${DOCKER_IMAGE}:18

build:
	@echo 'Starting docker build with slim'
	docker build -f Dockerfile.slim . -t ${DOCKER_IMAGE}:slim

	@echo 'Starting docker push with slim'
	docker push ${DOCKER_IMAGE}:slim

	@echo 'Starting docker build'
	docker build . -t ${DOCKER_IMAGE}

	@echo 'Starting docker push'
	docker tag ${DOCKER_IMAGE} ${DOCKER_IMAGE_NAME}
	docker push ${DOCKER_IMAGE}
	docker push ${DOCKER_IMAGE_NAME}

	@echo 'Starting docker build with git'
	docker build -f Dockerfile.git . -t ${DOCKER_IMAGE_GIT}

	@echo 'Starting docker push with git'
	docker push ${DOCKER_IMAGE_GIT}

.PHONY:build

test:
	@echo 'Starting docker build with slim'
	docker build -f Dockerfile.slim . -t ${DOCKER_IMAGE}:slim

	@echo 'Starting docker build'
	docker build . -t ${DOCKER_IMAGE}

	@echo 'Starting docker run with slim'
	docker run --rm -it ${DOCKER_IMAGE}:slim --version

	@echo 'Starting docker run'
	docker run --rm -it ${DOCKER_IMAGE} --version

	@echo 'Starting docker run with git'
	docker run --rm -it ${DOCKER_IMAGE_GIT} --version

.PHONY:test