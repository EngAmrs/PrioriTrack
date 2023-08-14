include environment.env

build:
	docker-compose build
	
up:
	docker-compose up -d

restart:
	docker-compose restart
	
logs:
	docker-compose logs -f backend

console:
	docker-compose exec backend rails console

bash:
	docker-compose exec backend bash

stop:
	docker-compose stop

down:
	docker-compose down