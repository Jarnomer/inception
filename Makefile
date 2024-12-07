NAME := inception

COMPOSE_FILE   := ./srcs/docker-compose.yml
DOCKER_COMPOSE := docker compose -f $(COMPOSE_FILE)

all: up

up:
	$(DOCKER_COMPOSE) up --build

down:
	$(DOCKER_COMPOSE) down

restart: down up

pause:
	${DOCKER_COMPOSE} pause

unpause:
	${DOCKER_COMPOSE} unpause

clean: down
	@echo "need clean command!"

fclean: clean
	${DOCKER} system prune -f

re: fclean all

ls:
	docker ps -a