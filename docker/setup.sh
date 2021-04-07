#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e "😺 ${GREEN}Booting Environment!${NC}";

# update env variables
export $(cat .env)

stores=( DE )

# pull images
#docker-compose pull

# create container, start container, detached
#docker-compose up -d

# find RMQ and APP container
rmqcontainer=$(docker ps --filter name=${COMPOSE_PROJECT_NAME}_rabbitmq* -aq)
appcontainer=$(docker ps --filter name=${COMPOSE_PROJECT_NAME}_app* -aq)


# wait until RabbitMQ is up
echo -n "wait until RabbitMQ 🐰 is up"
#while [ "`docker inspect -f {{.State.Health.Status}} ${rmqcontainer}`" != "healthy" ]; do echo -n ".";sleep 2; done

# create RMQ vhosts
docker exec -i ${rmqcontainer} rabbitmqctl add_user admin mate20mg
docker exec -i ${rmqcontainer} rabbitmqctl set_user_tags admin administrator

for store in "${stores[@]}"
do
    docker exec -i ${rmqcontainer} rabbitmqctl add_vhost /${store}_development_zed
    docker exec -i ${rmqcontainer} rabbitmqctl add_user ${store}_development mate20mg
    docker exec -i ${rmqcontainer} rabbitmqctl set_user_tags ${store}_development administrator
    docker exec -i ${rmqcontainer} rabbitmqctl set_permissions -p /${store}_development_zed ${store}_development ".*" ".*" ".*"
    docker exec -i ${rmqcontainer} rabbitmqctl set_permissions -p /${store}_development_zed admin ".*" ".*" ".*"
done

# install spryker
#docker exec -i ${appcontainer} composer install -no
sudo chmod 777 ../current/data/ -R
sudo chmod 660 ../current/config/Zed/dev_only_private.key

echo -e "😺 ${GREEN}Booting Environment, done!${NC}";
echo -e "👇 ${GREEN}Please edit /etc/hosts and add new domains:${NC}";

for store in "${stores[@]}"
do
    echo "127.0.0.1 ${store}.www.suite.local" | tr '[:upper:]' '[:lower:]'
    echo "127.0.0.1 ${store}.zed.suite.local" | tr '[:upper:]' '[:lower:]'
    echo "127.0.0.1 ${store}.glue.suite.local" | tr '[:upper:]' '[:lower:]'
    echo "127.0.0.1 ${store}.test-www.suite.local" | tr '[:upper:]' '[:lower:]'
    echo "127.0.0.1 ${store}.test-zed.suite.local" | tr '[:upper:]' '[:lower:]'
    echo "127.0.0.1 ${store}.test-glue.suite.local" | tr '[:upper:]' '[:lower:]'
done

echo -e "👇 ${GREEN}To install application [Development] please execute:${NC}";

echo -e "$ docker exec -it ${COMPOSE_PROJECT_NAME}_app_1 bash"
echo -e "$ vendor/bin/install DE && chmod 777 -R data/ && chown 1000:1000 -R ."
