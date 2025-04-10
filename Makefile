DOCKER_COMPOSE = docker compose -f local.yml

DOCKER_RUN = $(DOCKER_COMPOSE) run --rm django
RUN_MANAGE_PY = $(DOCKER_RUN) python manage.py

up:
	$(DOCKER_COMPOSE) up --force-recreate $(service)

build:
	$(DOCKER_COMPOSE) build

down:
	$(DOCKER_COMPOSE) down

down-v:
	$(DOCKER_COMPOSE) down -v

migrate:
	$(RUN_MANAGE_PY) migrate $(app) $(num)

makemigrations:
	$(RUN_MANAGE_PY) makemigrations

createsuperuser:
	$(RUN_MANAGE_PY) createsuperuser

shell:
	$(DOCKER_COMPOSE) exec -it django bash

mypy:
	$(DOCKER_RUN) mypy .

test:
	$(DOCKER_RUN) pytest $(path)

chown:
	sudo chown -R $(USER):$(USER) .

pre-commit:
	pre-commit run --all-files
