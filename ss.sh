#!/bin/bash
sudo yum install epel-release
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install shadowsocks-libev
## vim /snap/bin/config.json
echo '{
    "server":"xx",
    "server_port":39776,
    "local_port":1080,
    "password":"xxx",
    "timeout":60,
    "method":"chacha20-ietf-poly1305",
    "fast_open":false
}' >  /snap/bin/config.json
## vim /lib/systemd/system/ss.service
echo '[Unit]
Description=Shadowsocks Server
After=network.target

[Service]
Restart=on-abnormal
#ExecStart=/snap/bin/shadowsocks-libev.ss-server -c /snap/bin/config.json -b 0.0.0.0 > /dev/null 2>&1
ExecStart=/snap/bin/shadowsocks-libev.ss-local -c /snap/bin/config.json -b 0.0.0.0 > /dev/null 2>&1

[Install]
WantedBy=multi-user.target' > /lib/systemd/system/ss.service

sudo systemctl daemon-reload
sudo systemctl start ss.service
sudo systemctl status ss.server
