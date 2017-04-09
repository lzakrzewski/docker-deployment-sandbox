sandbox_up:
	git submodule update --init && \
	docker-compose up -d
	docker-compose run php-fpm composer setup-data-prod
	docker-compose run php-fpm /setup-permissions.sh

sandbox_down:
	docker-compose down

deploy:
	sandbox_up
