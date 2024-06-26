#!/bin/bash

start(){
    docker-compose up -d
}
stop(){
    docker-compose stop
}
console(){
    docker-compose up
}
redis(){
    docker exec -it redis bash -c "redis-cli -a 123456" 
}
mysql(){
    docker exec -it  mysql bash -c "mysql -uroot -p"
}
pg(){
    docker exec -it  pg bash -c "psql -U postgres -d example_db"
}
rabbitmq(){
    docker exec -it rabbitmq bash
}
attach_mysql(){
   docker exec -it mysql bash
}
log(){
	docker logs $1
}
help(){
    echo "sh tool.sh start --- start all service in background mode"
    echo "sh tool.sh stop ---- stop all service"
    echo "sh tool.sh console --- start all service in console mode"
    echo "sh tool.sh redis ---  redis-cli"
    echo "sh tool.sh mysql ---  mysql"
    echo "sh tool.sh pg ---  pg"
}
case $1 in
attach_mysql) attach_mysql;;
start) start;;
stop) stop;;
console) console;;
redis) redis;;
mysql) mysql;;
rabbitmq) rabbitmq;;
log) log $2;;
pg) pg;;
*) help;;
esac
