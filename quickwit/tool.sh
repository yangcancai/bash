#!/bin/bash

install(){
	docker run --rm -it -v "$(pwd)":"/quickwit/files" --entrypoint sh quickwit/quickwit
}
start(){
	docker run -d --name quickwit -v $(pwd)/qwdata:/quickwit/qwdata -p 127.0.0.1:7280:7280 quickwit/quickwit run
}
console(){
	docker run --init --rm -v $(pwd)/qwdata:/quickwit/qwdata -p 127.0.0.1:7280:7280 quickwit/quickwit run
}
attach(){
	docker exec -it quickwit /bin/bash 
}
stop(){
	 docker stop quickwit && docker rm quickwit
}
log(){
	docker logs quickwit
}
help(){
	echo "sh tool.sh start|stop|console|install|log|attach"
}
case $1 in
install) install;;
start) start;;
stop) stop;;
attach) attach;;
log) log;;
console) console;;
*)help;;
esac
