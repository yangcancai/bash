# !/bin/bash
IMAGE="xxx"
PROJ_DIR="/app"
PORT="-p 4002:4002 -p 4003:4003"
http_proxy="socks5://user:pwd@ip:port"
https_proxy=$http_proxy
# DOCKER_ENV="-e http_proxy=$http_proxy -e https_proxy=$https_proxy \
            # -e HTTP_PROXY=$http_proxy -e HTTPS_PROXY=$https_proxy \
	    # -e no_proxy=$no_proxy -e NO_PROXY=$no_proxy"
DOCKER_ENV="-c 4 -v "$HOME/.npm:/root/.npm""
DOCKER_PORT="-p 4002:4002 -p 4003:4003"
DOCKER_PROXY=$http_proxy
GIT_HOST="git.xxxx.com"
DOCKER_OPTION=" run -it --rm  -e GIT_USER -e GIT_ACCESS_TOKEN $DOCKER_ENV $DOCKER_PORT  -v "$(pwd):$PROJ_DIR" $IMAGE /bin/bash -c "
## install docker for centos 7.9
install(){
    yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/docker-1.13.1-203.git0be3e21.el7.centos.x86_64.rpm
    ## start docker daemon
    systemctl start docker
}
build_docker(){
    #docker build --no-cache -t $IMAGE .
    docker build --compress --rm -t $IMAGE .
}
run_docker(){
    docker $DOCKER_OPTION ". /root/.asdf/asdf.sh && . /root/.asdf/completions/asdf.bash && sh tool.sh before_script && $1"
}
proxy_str(){
echo "[https \"https://$GIT_HOST/\"]
        proxy = $DOCKER_PROXY 
[http \"https://$GIT_HOST/\"]
        proxy = $DOCKER_PROXY"
}
git_proxy(){
	echo "$(proxy_str)" >> ~/.gitconfig
}
before_script(){
    unset http_proxy; unset HTTPS_PROXY;unset https_proxy;unset HTTP_PROXY
    git config --global credential.helper 'store --file ~/.git-credentials'
    git_proxy
	echo "<IP> <HOST>" >> /etc/hosts
	echo "https://$GIT_USER:$GIT_ACCESS_TOKEN@$GIT_HOST" > ~/.git-credentials
}
tar_docker(){
    run_docker "make tar "
}
sh_docker(){
    if [ "$1" == "" ]
    then
    run_docker "sh"
    else
    run_docker "$1"
    fi
}
make_docker(){
    run_docker "make $1"
}