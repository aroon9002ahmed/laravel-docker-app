setup:
	@make build
	@make up
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-docker-app bash -c "composer update"
data:
	docker exec laravel-docker-app bash -c "php artisan storage:link"
	docker exec laravel-docker-app bash -c "php artisan key:generate"
	docker exec laravel-docker-app bash -c "php artisan migrate"
	docker exec laravel-docker-app bash -c "php artisan db:seed"
migrate-fresh:
	docker exec laravel-docker-app bash -c "php artisan migrate:fresh --seed"