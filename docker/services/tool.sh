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
help(){
    echo "sh tool.sh start --- start all service in background mode"
    echo "sh tool.sh stop ---- stop all service"
    echo "sh tool.sh console --- start all service in console mode"
}
case $1 in
start) start;;
stop) stop;;
console) console;;
*) help;;
esac