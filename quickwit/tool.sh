#!/bin/bash

install(){
	docker run --rm -it -v "$(pwd)":"/quickwit/files" --entrypoint sh quickwit/quickwit
}
start(){
	docker run -d --name quickwit -v $(pwd)/qwdata:/quickwit/qwdata -p 127.0.0.1:7280:7280 quickwit/quickwit run
}
start_vector(){
	docker run -d --name vector -v /data/mchat/im_container/im_container/log:/data/logs -v $(pwd)/im_container_vector.toml:/etc/vector/vector.toml:ro -p 8383:8383 --add-host=host.docker.internal:host-gateway timberio/vector:0.21.2-distroless-libc
}
console_vector(){
	#docker run --init --rm -v $(pwd)/logs:/data/logs -v $(pwd)/im_container_vector.toml:/etc/vector/vector.toml:ro -p 8383:8383 --add-host=host.docker.internal:host-gateway timberio/vector:0.21.2-distroless-libc
	docker run --init --rm -v /Users/cam/proj/erlang/im_container/log:/data/logs -v $(pwd)/im_container_vector.toml:/etc/vector/vector.toml:ro -p 8383:8383 --add-host=host.docker.internal:host-gateway timberio/vector:0.21.2-distroless-libc
}
console(){
	docker run --init --rm -v $(pwd)/qwdata:/quickwit/qwdata -p 127.0.0.1:7280:7280 quickwit/quickwit run
}
attach(){
	docker exec -it quickwit /bin/bash 
}
stop_vector(){
	docker stop vector && docker rm vector
}
stop(){
	 docker stop quickwit && docker rm quickwit
}
log(){
	docker logs quickwit
}
create_index(){
	docker run --rm -it -v $(pwd)/qwdata:/quickwit/qwdata -v $(pwd)/im_container-logs.yaml:/quickwit/index-config.yaml quickwit/quickwit index create --index-config /quickwit/index-config.yaml
}
del_index(){
	docker run --rm -it -v $(pwd)/qwdata:/quickwit/qwdata -v $(pwd)/im_container-logs.yaml:/quickwit/index-config.yaml quickwit/quickwit index  delete --index im_container-logs
}
help(){
	echo "sh tool.sh start|stop|console|install|log|attach|create_index|start_vector|stop_vector|console_vector|del_index"
}
case $1 in
install) install;;
create_index) create_index;;
start) start;;
stop) stop;;
attach) attach;;
del_index) del_index;;
log) log;;
console) console;;
start_vector) start_vector;;
stop_vector) stop_vector;;
console_vector) console_vector;;
*)help;;
esac
