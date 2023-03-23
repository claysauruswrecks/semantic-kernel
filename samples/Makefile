#!make

.PHONY: build
docker-build:
	docker-compose \
        -f ./docker-compose.yaml \
        build

.PHONY: shell
docker-shell:
	docker-compose \
        -f ./docker-compose.yaml \
		run \
		--rm \
		-v $${PWD}/samples/:/opt/semantic-kernel/ \
		semantic-kernel \
		bash

.PHONY: docker-run
docker-run:
	docker-compose \
		run \
		--rm \
		-v $${PWD}/samples/:/opt/semantic-kernel/ \
		semantic-kernel
