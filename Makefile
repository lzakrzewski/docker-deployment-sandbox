sandbox_up:
	git submodule update --init && \
	docker-compose up -d
	cp php-fpm/parameters.yml simple-prepaid-card/app/config
	docker-compose run php-fpm composer install -n
	docker-compose run php-fpm composer setup-data-prod
	docker-compose run php-fpm /setup-permissions.sh

sandbox_down:
	docker-compose down
