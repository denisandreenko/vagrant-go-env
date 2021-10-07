#!/usr/bin/env bash

apt-get update

#install git
apt-get install git

#install wget
apt-get install wget

#install docker
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#set up the stable repository
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update

apt-get -y install docker-ce docker-ce-cli containerd.io

#install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

#install go
GODIST=go1.17.1.linux-amd64.tar.gz
GO_TAR_PATH=/usr/local/$GODIST
if [ ! -f "$GO_TAR_PATH" ]; then 
    wget -P /usr/local https://golang.org/dl/$GODIST
    rm -rf /usr/local/go && tar -C /usr/local -xzf $GO_TAR_PATH
fi
export PATH=$PATH:/usr/local/go/bin

