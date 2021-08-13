#docker run -itd --rm --name rabbitmq\
#-v "rabbitmq/etc:/etc/rabbitmq" \
#-v "rabbitmq/lib:/var/lib/rabbitmq"\
#-v "rabbitmq/log:/var/log/rabbitmq"\ -p 5672:5672 -p 15672:15672 rabbitmq:3-management

start_docker(){
	docker run -it --rm --name rabbitmq2  --mount type=bind,source=$(pwd)/rabbitmq/etc/enabled_plugins,target=/etc/rabbitmq/enabled_plugins  -v $(pwd)/rabbitmq/etc:/etc/rabbitmq -v $(pwd)/rabbitmq/lib:/var/lib/rabbitmq -v $(pwd)/rabbitmq/log:/var/log/rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3-management
}
install(){
	yum install socat logrotate -y
	yum install -y epel-release
 	yum install -y  build-essential openssl openssl-devel unixODBC unixODBC-devel  make gcc gcc-c++ kernel-devel m4 ncurses-devel tk tc xz
 	yum install -y unixODBC  unixODBC-devel wxBase  wxGTK SDL wxGTK-gl
	wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_24.0.5-1~centos~7_amd64.rpm
	rpm -iv esl-erlang_24.0.5-1~centos~7_amd64.rpm
	wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.17/rabbitmq-server-3.8.17-1.el7.noarch.rpm
	rpm -iv rabbitmq-server-3.8.17-1.el7.noarch.rpm
	## erlang term format
	#wget https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.7.x/deps/rabbit/docs/rabbitmq.config.example
	## sysctl format
	wget https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.8.x/deps/rabbit/docs/rabbitmq.conf.example
	wget https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/master/deps/rabbit/docs/advanced.config.example
	cp rabbitmq.config.example /etc/rabbitmq/rabbitmq.config
	cp advanced.config.example /etc/rabbitmq/advanced.config
}
uninstall(){
	rpm -e rabbitmqserver
	rpm -e esl-erlang
}
start(){
	nohup rabbitmq-server > ./rabbitmq.log 2>&1 &
}
stop(){
	rabbitmqctl shutdown
}
help(){
	echo "sh tool.sh start -- start rabbitmq broker"
	echo "sh tool.sh start_docker -- start rabbitmq docker broker"
	echo "sh tool.sh install -- install rabbitmq-server"
	echo "sh tool.sh uninstall -- uninstall rabbitmq-server & els-erlang"
	echo "sh tool.sh stop -- stop rabbitmq-server"
}
case $1 in
install) install;;
uninstall) uninstall;;
start) start;;
start_docker) start_docker;;
stop) stop;;
*) help;;
esac