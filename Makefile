include srcs/.env

all: build

build:
	${SUDO} mkdir -p ${WP_VOLUME}
	${SUDO} mkdir -p ${DB_VOLUME}
	docker-compose -f $(COMPOSE_FILE) up --build -d

prune:
	${SUDO} rm -rf ${WP_VOLUME}
	${SUDO} rm -rf ${DB_VOLUME}
	docker-compose -f $(COMPOSE_FILE) down
	docker system prune -af
	docker volume rm srcs_database || true
	docker volume rm srcs_wp_volume || true


status:
	@echo "        ################   containers   #################        "	
	@docker container ls
	@echo "        ################     images     #################        "	
	@docker image ls
	@echo "        ################    volumes     #################        "	
	@docker volume ls
	@echo "        ################    networks    #################        "	
	@docker network ls

down:
	docker-compose -f ./srcs/docker-compose.yml down

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

help:
	@echo " ------------------------------------------------------- "
	@echo "| Makefile for managing Docker and Docker-compose tasks |"
	@echo " ------------------------------------------------------- "
	@echo "| make build       Build services.                      |"
	@echo "| make prune       Bring down services,                 |"
	@echo "|                  Remove unused docker objects.        |"
	@echo "| make status      Display the status of docker         |"
	@echo "|                  countainers.                         |"
	@echo "| make down        Bring down services, removing        |"
	@echo "|                  countainers.                         |"
	@echo "| make start       Start services.                      |"
	@echo "| make stop        Stop services.                       |"
	@echo "| make help        Show this help message.              |"
	@echo " ------------------------------------------------------- "
