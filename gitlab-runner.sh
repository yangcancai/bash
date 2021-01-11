# !/bin/bash
http_proxy="socks5://user:pwd@ip:port"
## 代码仓库的域名
GIT_HOST="git.xxxx.com"
## 代码仓库的ip
GIT_IP="x.x.x.x"

# [[runners]]
#   name = "proj"
#  limit=1
#   url = "https://$GIT_HOST"
#   token = "Z6mV6UiurYSJrVXav96Z"
#   environment = ["https_proxy=$http_proxy", "http_proxy=$http_proxy", "HTTPS_PROXY=$http_proxy", "HTTP_PROXY=$http_proxy"]
#   executor = "docker"
#   [runners.custom_build_dir]
#   [runners.cache]
#     [runners.cache.s3]
#     [runners.cache.gcs]
#     [runners.cache.azure]
#   [runners.docker]
#     tls_verify = false
#     image = "centos:7"
#     privileged = true
#     disable_entrypoint_overwrite = false
#     oom_kill_disable = false
#     disable_cache = true
#     volumes = ["/cache/proj", "/var/run/docker.sock:/var/run/docker.sock"]
#     extra_hosts = ["$GIT_HOST:$GIT_IP"]
#     pull_policy = "if-not-present"
#     shm_size = 0

run(){
docker run -d --name gitlab-runner --restart always \
--add-host $GIT_HOST:$GIT_IP  \
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
--add-host $HOST:$GIT_IP  \
-e http_proxy=$http_proxy -e https_proxy=$https_proxy \
-e HTTP_PROXY=$http_proxy -e HTTPS_PROXY=$https_proxy \
-v "/srv/gitlab-runner/config:/etc/gitlab-runner" \
-v "/var/run/docker.sock:/var/run/docker.sock" \
gitlab/gitlab-runner:latest register
}
restart(){
     docker restart gitlab-runner
}