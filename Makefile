SOURCE_FOLDER  := ./srcs/requirements
COMPOSE_FILE   := ./srcs/docker-compose.yml
DOCKER_COMPOSE := docker compose -f $(COMPOSE_FILE)

all: up

up:
	$(DOCKER_COMPOSE) up --build

down:
	$(DOCKER_COMPOSE) down -v --rmi all

re: down up

clean: down

fclean: clean
	docker builder prune -f