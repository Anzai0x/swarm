#!/bin/bash
#开放1635端口
firewall-cmd --zone=public --add-port=1635/tcp --permanent
firewall-cmd --reload

#创建并进入bee文件夹
cd /mnt
mkdir bee
cd bee

#下载clef-service
wget https://gateway.ethswarm.org/files/34c2b1a9a793f655f9b67afed726ba00794cfc77d951a3e017f4f2c7a6bc281c
mv 34c2b1a9a793f655f9b67afed726ba00794cfc77d951a3e017f4f2c7a6bc281c clef-service
chmod a+x /mnt/bee/clef-service

#下载clef并安装clef
yum install -y wget
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.10/bee-clef_0.4.10_amd64.rpm
rpm -i bee-clef_0.4.10_amd64.rpm

#下载bee并安装bee
wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm
rpm -i bee_0.5.3_amd64.rpm

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
./clef-service start

#后台运行bee
#cd /mnt/bee/
#screen -S bee
