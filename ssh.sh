#!/bin/bash
## ssh-add 必须在同一个shell执行完所有命令
## 不可以分开
. ./util.sh
ssh_before_script(){
        eval $(ssh-agent -s)
        echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
        mkdir -p ~/.ssh
        chmod 700 ~/.ssh
        ## verification publickey
        ## Fix Host key verification failed.
        ssh-keyscan -p $SSH_PORT $SSH_IP >> ~/.ssh/known_hosts
        # must do ssh -p$PORT $USER@$HOST "cmd"
}
ssh_scp_tar(){
       scp -P$SSH_PORT -r -p $SCP_SRC_FILE  $SSH_USER@$SSH_IP:$SCP_DST_DIR
}
ssh_restart(){
  ssh_before_script
  ssh_scp_tar
  TOOL="#!/bin/bash\n## auto generate dont edit \n$(env_str)\n$(cat util.sh | sed '1d')\n restart"
  CMD="cd $SCP_DST_DIR && echo -e '$TOOL' > ci.sh && chmod +x ci.sh&& ./ci.sh"
  ssh -p$SSH_PORT $SSH_USER@$SSH_IP "$CMD"
}