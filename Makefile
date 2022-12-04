
all_update:
	@docker compose up --force-recreate --build --remove-orphans -d
	@docker image prune -f
	@make nginx_reload
	

web_update_stage:
	@docker compose up --pull --force-recreate --no-deps lovemanifest-staging -d
	@docker image prune -f
	@make nginx_reload

web_update_prod:
	@docker compose up --pull --force-recreate --no-deps lovemanifest -d
	@docker image prune -f
	@make nginx_reload


imgcdn_update_stage:
	@docker compose up --pull --force-recreate --no-deps imgcdn-staging -d
	@docker image prune -f
	@make nginx_reload

imgcdn_update_prod:
	@docker compose up --pull --force-recreate --no-deps imgcdn -d
	@docker image prune -f
	@make nginx_reload


nginx_test:
	@docker compose exec --no-TTY nginx nginx -t

nginx_reload:
	@docker compose exec --no-TTY nginx nginx -s reload