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
    docker exec -it dev_redis_latest bash -c "redis-cli -a 123456" 
}
mysql(){
    docker exec -it dev_mysql_latest bash -c "mysql"
}
help(){
    echo "sh tool.sh start --- start all service in background mode"
    echo "sh tool.sh stop ---- stop all service"
    echo "sh tool.sh console --- start all service in console mode"
    echo "sh tool.sh redis ---  redis-cli"
    echo "sh tool.sh mysql ---  mysql"
}
case $1 in
start) start;;
stop) stop;;
console) console;;
redis) redis;;
mysql) mysql;;
*) help;;
esac