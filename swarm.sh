#!/bin/bash
#开放1635端口
firewall-cmd --zone=public --add-port=1635/tcp --permanent
firewall-cmd --reload

#创建并进入bee文件夹
cd /mnt
mkdir bee
cd bee

#下载clef-service
yum install -y wget
wget https://raw.githubusercontent.com/MichaelJi233/cryptohunter/main/clef-service
chmod a+x /mnt/bee/clef-service

#下载clef并安装clef
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.rpm
rpm -i bee-clef_0.4.12_amd64.rpm

#下载bee并安装bee
wget https://github.com/ethersphere/bee/releases/download/v0.6.0/bee_0.6.0_amd64.rpm
rpm -i bee_0.6.0_amd64.rpm

#安装screen、epel源、jq
yum install -y screen
yum install -y epel-release
yum install -y jq

#下载兑现支票脚本
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/b40510f1172b96c21d6d20558ca1e70d26d625c4/cashout.sh

#赋予权限
chmod a+x cashout.sh

#后台运行clef-service
cd /mnt/bee/
screen -S clef
#sh clef-service start

#后台运行bee
#cd /mnt/bee/
#screen -S bee
