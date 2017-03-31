sandbox_up:
	git submodule update --init && \
	docker-compose up -d
	cp configuration/parameters.yml simple-prepaid-card/app/config
	docker-compose run php composer install -n
	docker-compose run php composer setup-data-prod

sandbox_down:
	docker-compose down
