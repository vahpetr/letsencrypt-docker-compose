
update:
	@docker compose up --force-recreate --build --remove-orphans -d
	@docker image prune -f
	