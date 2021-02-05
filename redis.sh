#!/bin/bash
# config
#vi /etc/redis.conf
#vi /usr/lib/systemd/system/redis.service
# 如果出现217错误请修改User
# User=redis
#systemctl daemon-reload # 修改了redis.service需要reload
#systemctl start redis.service #启动redis服务器
#systemctl stop redis.service #停止redis服务器
#systemctl restart redis.service #重新启动redis服务器
#systemctl status redis.service #获取redis服务器的运行状态
#systemctl enable redis.service #开机启动redis服务器
#systemctl disable redis.service #开机禁用redis服务器
OPT="-a VjPktbj619w9AbZGK1Qvg9+eazgUZNgGyEdeNTAmcnVeaPOdpmbqwZyHu4y7sreM"
install(){
        sudo yum install -y epel-release
        sudo yum update -y
        sudo yum install -y redis
}
start(){
        sudo systemctl start redis
}
stop(){
        sudo systemctl stop redis
}
restart(){
        sudo systemctl restart redis
}
status(){
        sudo systemctl status redis
}
cli(){
        redis-cli $OPT
}
notify(){
        redis-cli $OPT config set notify-keyspace-events AKE
}
subscribe(){
        redis-cli $OPT --csv psubscribe '__key*__:*'
}
monitor(){
        redis-cli $OPT monitor
}
case $1 in
install) install;;
start) start;;
stop) stop;;
restart) restart;;
status) status;;
cli) cli;;
notify) notify;;
subscribe)subscribe;;
monitor) monitor;;
*) help;;
esac