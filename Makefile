include .env
export $(shell sed 's/=.*//' .env)

#
## Aliases
#
h: help

u: up
upd: up-daemon
s: stop
d: down
l: logs
sh: shell

#
## Rules
#

help:			### (Current) (Alias=h) See all available commands
	@fgrep -h "###" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/###//'

up:			### (Alias=u) Up docker containers
	@docker-compose up

up-daemon:		### (Alias=upd) Up docker containers as a daemon
	@docker-compose up -d

stop:			### (Alias=s) Stop docker containers
	@docker-compose stop

down:			### (Alias=d) Down docker containers
	@docker-compose down

logs:			### (Alias=l) Display docker containers logs
	@docker-compose logs -f

shell:			### (Alias=sh) Access postgres via shell
	@docker-compose exec postgres psql -U $(DATABASE_USER) -d $(DATABASE_NAME)

.PHONY: help up up-daemon stop down shell logs