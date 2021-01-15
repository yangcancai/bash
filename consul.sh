#!/bin/bash
IP=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
conf(){
        echo -e "{
  \"datacenter\": \"crm\",
  \"bind_addr\": \"${IP}\",
  \"client_addr\": \"0.0.0.0\",
  \"data_dir\": \"/data/consul/data\",
  \"log_level\": \"INFO\",
  \"server\": true,
  \"ui\": true,
  \"bootstrap_expect\": 3,
  \"retry_join\": [\"192.168.1.2\",\"192.168.1.3\",\"192.168.1.4\"],
  \"rejoin_after_leave\": true,
  \"advertise_addr_wan\": \"${IP}\"
}" > /data/consul/config/consul.d/consul.json
}
install_service(){
        echo -e "
[Unit]
Description=consul agent
Requires=network-online.target
After=network-online.target


[Service]
User=leboadmin
ExecStart=/usr/bin/consul agent -config-dir=/data/consul/config/consul.d/
ExecReload=/usr/bin/consul reload
KillMode=process
Restart=on-failure
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
" >> /etc/systemd/system/consul.service
        systemctl daemon-reload
        systemctl enable consul
        systemctl start consul
}
install_consul(){
        wget https://releases.hashicorp.com/consul/1.9.0/consul_1.9.0_linux_amd64.zip
        unzip consul_1.9.0_linux_amd64.zip && \
        sudo mv consul /usr/bin/
        rm -rf consul_1.9.0_linux_amd64.zip
        sudo mkdir -p /data/consul/data
        sudo mkdir -p /data/consul/config/consul.d
        sudo chown -R leboadmin:leboadmin /data/consul
}
run_consul(){
    consul agent \
  -server \
  -bootstrap-expect=1 \
  -node=agent-one \
  -bind=$IP \
  -data-dir=/data/consul/data \
  -enable-script-checks=true \
  -config-dir=/data/consul/config/consul.d \
  -ui & > /dev/null
}
stop_consul(){
        consul leave
}
case $1 in
   run_consul) run_consul;;
   stop_consul) stop_consul;;
   install_consul) install_consul;;
   install_service) install_service;;
   conf) conf;;
  *)
install_consul
conf
sudo sh tool.sh install_service
;;
 esac
