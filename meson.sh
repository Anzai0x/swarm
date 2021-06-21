#!/bin/bash

firewall-cmd --zone=public --add-port=19091/tcp --permanent
firewall-cmd --reload

wget 'https://coldcdn.com/api/cdn/f2cobx/terminal/v2.5.1/meson-linux-amd64.tar.gz'
tar -zxf meson-linux-amd64.tar.gz
cd ./meson-linux-amd64

sudo ./meson service-install
