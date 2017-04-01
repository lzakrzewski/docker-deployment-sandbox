sandbox_up:
	git submodule update --init && \
	docker-compose up -d
	cp php-fpm/parameters.yml simple-prepaid-card/app/config
	docker-compose run php-fpm composer install -n
	docker-compose run php-fpm composer setup-data-prod
	docker-compose run php-fpm /setup-permissions.sh

sandbox_down:
	docker-compose down


SSH_KEY_RAW = $(shell cat test-host/test_key.pub)

test_host_build:
	docker build --build-arg SSH_KEY_RAW='$(SSH_KEY_RAW)' -t test-host -f test-host/test_host.dockerfile test-host

test_host_up: test_host_build
	docker run --name test-host -h test-host -p 22:22 -p 8080:8080 -d test-host
