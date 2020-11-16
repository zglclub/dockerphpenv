#! /bin/bash
#install docker
sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

sudo systemctl start docker
sudo systemctl enable docker.service

mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{"registry-mirrors":["https://reg-mirror.qiniu.com/"]}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo yum -y update
sudo yum -y install epel-release
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py   # 下载安装脚本
sudo python get-pip.py  
sudo pip install --upgrade pip
sudo yum -y install python-pip
sudo pip install -U docker-compose
docker-compose up
