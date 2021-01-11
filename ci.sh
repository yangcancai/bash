# !/bin/bash
# example
# image: xxx:latest
# variables:
#    ## setting ci/cd variable
#   #SSH_USER: "admin"
#   #SSH_PORT: 99
#   #SSH_IP: 127.0.0.1
#   # SSH_PRIVATE_KEY: "" 
# before_script:
#   - export LANG=en_US.UTF-8
#   - . /root/.asdf/asdf.sh && . /root/.asdf/completions/asdf.bash
#   - cat /etc/hosts
#   - erl -v
#   - elixir -v
#   - git config --global credential.helper store
#   - echo "https://gitlab-ci-token:${CI_JOB_TOKEN}@$GIT_HOST" > ~/.git-credentials
#   - sh tool.sh git_proxy
#   - cat ~/.gitconfig
#   - unset http_proxy;unset HTTPS_PROXY;unset https_proxy;unset HTTP_PROXY
#   - git reset --hard
# stages:
#   - deploy
# dev-deploy:
#   stage: deploy
#   only:
#     - develop 
#   except:
#     - tags
#   script:
#     - sh tool.sh pull develop
#     - sh tool.sh build_frontend
#     - sh tool.sh release develop uat
#     - sh tool.sh ssh_restart
#   cache:
#     key: "crm_unbrella_develop"
#     paths:
#       - _build/
#       - deps/
#       - assets/node_modules
#       - ~/.npm
#   tags:
#     - dockers
  git config --global credential.helper store
  echo "https://gitlab-ci-token:${CI_JOB_TOKEN}@$GIT_HOST" > ~/.git-credentials