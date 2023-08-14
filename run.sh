#!/bin/bash
sudo ufw allow 9200/tcp
sudo ufw allow 55642/tcp
sudo sed -i '16i\Port 9200' /etc/ssh/sshd_config
sudo sed -i '16i\Port 55642' /etc/ssh/sshd_config
sudo service ssh restart
sudo apt update
sudo apt install nginx
sudo apt install python3-pip
sudo ufw allow 'Nginx HTTP'
sudo adduser carl --shell=/bin/false --no-create-home