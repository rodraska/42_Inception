all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all

cleanall:
	sudo rm -rf /home/rreis-de42/data/wordpress/*
	sudo rm -rf /home/rreis-de42/data/mysql/*
	docker system prune -a --volumes

re: cleanall all

info:
	@echo "Containers:"
	docker ps -a
	@echo "Images:"
	docker images -a
	@echo "Volumes:"
	docker volume ls
	@echo "Networks:"
	docker network ls

connect:
	docker exec -it mariadb mysql -u root -p

PHONY: all up down start stop clean cleanall info connect