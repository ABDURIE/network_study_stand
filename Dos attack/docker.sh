#!/bin/bash

sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# install docker
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
    docker-compose

# post install actions
sudo usermod -aG docker vagrant

# configure alternative Dockerhub mirrors
sudo mkdir -p /etc/docker
echo '{"registry-mirrors": ["https://cr.yandex/mirror", "https://mirror.gcr.io"]}' | sudo tee /etc/docker/daemon.json > /dev/null
sudo systemctl restart docker

echo "VM IS READY!"
exit 0