# !/bin/bash
http_proxy="socks5://user:pwd@ip:port"
## 代码仓库的域名
HOST="git.xxxx.com"
## 代码仓库的ip
IP="x.x.x.x"
run(){
docker run -d --name gitlab-runner --restart always \
--add-host $HOST:$IP  \
-e http_proxy=$http_proxy -e https_proxy=$https_proxy \
-e HTTP_PROXY=$http_proxy -e HTTPS_PROXY=$https_proxy \
-v "$(which docker):/usr/bin/docker" \
-v "/srv/gitlab-runner/config:/etc/gitlab-runner" \
-v "/var/run/docker.sock:/var/run/docker.sock" \
-v "/cache:/cache" \
gitlab/gitlab-runner:latest
}
stop(){
     docker stop gitlab-runner && docker rm gitlab-runner
}
attach(){
     docker exec -it gitlab-runner /bin/bash
}
log(){
     docker logs gitlab-runner
}
register(){
 docker run --rm -it --name gitlab-runner \
--add-host $HOST:$IP  \
-e http_proxy=$http_proxy -e https_proxy=$https_proxy \
-e HTTP_PROXY=$http_proxy -e HTTPS_PROXY=$https_proxy \
-v "/srv/gitlab-runner/config:/etc/gitlab-runner" \
-v "/var/run/docker.sock:/var/run/docker.sock" \
gitlab/gitlab-runner:latest register
}
restart(){
     docker restart gitlab-runner
}