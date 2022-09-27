#! /bin/bash
echo "For ubuntu 22.04"
if [ "$EUID" -ne 0 ]
	then echo "Run as root or sudo"
	exit
fi
link = "https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bubuntu22.04_all.deb"
wget -O /root/zabbix.deb https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-2%2Bubuntu22.04_all.deb 
dpkg -i /root/zabbix.deb
apt update
apt install -y zabbix-agent2 zabbix-agent2-plugin-mongodb
systemctl restart zabbix-agent2
systemctl enable zabbix-agent2