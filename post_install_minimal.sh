#!/bin/sh

while true; do ping -c1 www.google.com > /dev/null && break; done

sudo apt update && sudo apt upgrade -y

sudo apt install curl -y

sudo apt install docker.io docker-compose -y
sudo systemctl enable docker
sudo systemctl start docker

# sudo docker run -d \
# --name="portainer" \
# --restart on-failure \
# -p 9000:9000 \
# -p 8000:8000 \
# -v /var/run/docker.sock:/var/run/docker.sock \
# -v portainer_data:/data \
# portainer/portainer-ce:latest

sudo curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --authkey tskey-auth-kmYWEs4CNTRL-E58dqRPnpjitN4wH1JYshiDnogxNZCqR


sudo chmod +x *.sh

curl https://getmic.ro | bash
sudo chown root:root micro
sudo mv micro /usr/local/bin
sudo apt install xclip -y

sudo apt update && sudo apt upgrade -y

sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.old
sudo tee -a /etc/systemd/logind.conf <<EOF
HandleLidSwitch=ignore
LidSwitchIgnoreInhibited=no
EOF
sudo service systemd-logind restart

sudo tailscale ip -4

echo Done

exit
