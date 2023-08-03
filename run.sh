#!/bin/bash
sudo adduser carl --shell=/bin/false --no-create-home
sudo ufw allow 9200/tcp
sed -i '16i\Port 9200' /etc/ssh/sshd_config
sudo service ssh restart
sudo apt update
sudo apt install nginx
sudo ufw allow 'Nginx HTTP'
