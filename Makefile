
docker-deps-up:
	docker-compose -f setup/docker-compose.yml up -d

docker-deps-up-nodaemon:
	docker-compose -f setup/docker-compose.yml up

docker-deps-down:
	docker-compose -f setup/docker-compose.yml down

docker-deps-down-nuke:
	docker-compose -f setup/docker-compose.yml down
	docker image rm setup_postgres:latest
	docker system prune -f --volumes

runtests: docker-deps-up
	. ./test_env.sh && nose2
