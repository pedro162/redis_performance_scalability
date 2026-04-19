.PHONY: help up down logs cli backup

ifneq (,$(wildcard .env))
include .env
export
endif

.DEFAULT_GOAL := help

help: ## Show available commands
	@printf "\nAvailable commands:\n\n"
	@printf "  %-10s %s\n" "make up" "Start Redis container (detached)"
	@printf "  %-10s %s\n" "make down" "Stop and remove containers"
	@printf "  %-10s %s\n" "make logs" "Follow container logs"
	@printf "  %-10s %s\n" "make cli" "Open redis-cli (uses REDIS_PASSWORD)"
	@printf "  %-10s %s\n" "make backup" "Run metrics backup inside container"

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

cli:
	docker compose exec redis-estudos redis-cli -a "$$REDIS_PASSWORD"

backup:
	docker compose exec redis-estudos /data/backup_metrics.sh
