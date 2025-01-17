#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y
sudo apt install iputils-ping -y
sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

sudo docker run -d \
--name="portainer" \
--restart on-failure \
-p 9000:9000 \
-p 8000:8000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:latest

# sudo curl -s https://install.zerotier.com | sudo bash
# sudo zerotier-cli join 9f77fc393e977c16



sudo chmod +x *.sh
sudo apt install git -y
sudo docker run --name kali -it kalilinux/kali-rolling /bin/bash
echo "apt-get update && apt-get install kali-linux-everything -y"
