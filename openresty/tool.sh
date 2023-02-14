#!/bin/bash

install(){
	wget https://openresty.org/package/centos/openresty.repo
  	sudo mv openresty.repo /etc/yum.repos.d/
  	sudo yum check-update
  	sudo yum install openresty
  	sudo yum install openresty-resty
}
start(){
	sudo openresty -p `pwd`/ -c conf/nginx.conf	
}
reload(){
	sudo openresty  -p `pwd`/ -c conf/nginx.conf -s reload
}
stop(){
	sudo openresty -p `pwd`/ -c conf/nginx.conf -s stop
}
case $1 in
start) start;;
reload) reload;;
stop) stop;;
esac;
