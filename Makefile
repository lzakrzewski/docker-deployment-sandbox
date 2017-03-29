sandbox_up:
	git submodule update --init && \
	docker-compose up -d
	docker-compose run php composer install -n

sandbox_down:
	docker-compose down
