# !/bin/bash

sudo apt-get -y autoremove docker docker-engine docker.io
sudo apt-get update
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker
sudo gpasswd -a ${USER} docker

sudo su
echo '{"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn/"]}' > /etc/docker/daemon.json
sudo service docker restart
newgrp - docker
exit
