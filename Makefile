clean:
	rm -rf **/build/*

build: build-containers
	docker run \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--volume=${PWD}:/workdir \
		--workdir=/workdir \
		--env=HOST_PWD=${PWD} \
		ciaranmcnulty/builder \
		make build-all

build-containers:
	docker build --target=builder --tag=ciaranmcnulty/builder .
	docker build --target=builder-php --tag=ciaranmcnulty/builder-php .
	docker build --target=builder-javascript --tag=ciaranmcnulty/builder-javascript .

build-all: build-php build-javascript

build-php:
	docker run \
		--volume=${HOST_PWD}/php:/workdir \
		--workdir=/workdir \
		ciaranmcnulty/builder-php \
		php exec.php

build-javascript:
	docker run \
		--volume=${HOST_PWD}/javascript:/workdir \
		--workdir=/workdir \
		ciaranmcnulty/builder-javascript \
		node exec.js
