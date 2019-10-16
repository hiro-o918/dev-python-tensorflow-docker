GPU_ENV := $(shell which nvidia-smi)
IMAGE_NAME := python_tensorflow
CONTAINER_NAME := python_tensorflow
WORKINGDIR := /var/www
PWD := $(shell pwd)

ifdef GPU_ENV
    DOCKER_GPU_PARAMS := --gpus all
else
endif

.PHONY: _build/cpu
_build/cpu:
	@docker build --tag $(IMAGE_NAME) -f ${PWD}/docker/Dockerfile.cpu .

.PHONY: _build/gpu
_build/gpu:
	@docker build --tag $(IMAGE_NAME) -f ${PWD}/docker/Dockerfile.gpu .
	@${MAKE} proto/update
	@${MAKE} proto/gen

.PHONY: build
build:
    ifdef GPU_ENV
	    @${MAKE} _build/gpu
    else
	    @${MAKE} _build/cpu
    endif

.PHONY: run
run:
	@docker run \
		--rm -it \
		${DOCKER_GPU_PARAMS} \
		--name $(CONTAINER_NAME) \
		--volume $(PWD):$(WORKINGDIR) \
		$(CONTAINER_NAME) \
		${ARGS}

.PHONY: bash
bash: ARGS=bash
export ARGS
bash:
	@${MAKE} run

.PHONY: test
test: ARGS=pytest tests
export ARGS
test:
	@${MAKE} run

.PHONY: lint
lint: ARGS=flake8 src tests
export ARGS
lint:
	@${MAKE} run