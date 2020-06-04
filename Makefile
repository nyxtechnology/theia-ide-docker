include .env

.PHONY: up down stop prune

default: up

## help :       Print commands help.
help : docker.mk
        @sed -n 's/^##//p' $<

## up   :       Start up containers.
up:
        @echo "Starting up containers for $(PROJECT_NAME)..."
        docker-compose pull
        docker-compose up -d --remove-orphans

## down :       Stop containers.
down: stop

## start        :       Start containers without updating.
start:
        @echo "Starting containers for $(PROJECT_NAME) from where you left off..."
        @docker-compose start

## stop :       Stop containers.
stop:
        @echo "Stopping containers for $(PROJECT_NAME)..."
        @docker-compose stop

## prune        :       Remove containers and their volumes.
##              You can optionally pass an argument with the service name to prune single container
##              prune mariadb   : Prune `mariadb` container and remove its volumes.
##              prune mariadb solr      : Prune `mariadb` and `solr` containers and remove their volumes.
prune:
        @echo "Removing containers for $(PROJECT_NAME)..."
        @docker-compose down -v $(filter-out $@,$(MAKECMDGOALS))

