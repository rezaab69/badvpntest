#!/bin/sh
OS=`uname -m`;
yum update -y
yum install epel-release -y
yum install htop tmux screen -y
sudo wget -O /usr/bin/badvpn-udpgw "https://github.com/rezaab69/badvpntest/raw/main/badvpn-udpgw64"
sudo touch /etc/rc.local
sudo echo "\nnohup watch -n 120 screen -dmS udpvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 50" >> /etc/rc.local
sudo chmod +x /usr/bin/badvpn-udpgw
pkill badvpn-udpgw
sudo nohup watch -n 120 screen -dmS udpvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 50 &

