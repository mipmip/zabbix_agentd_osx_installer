#!/usr/bin/env bash

#To create a group:
sudo dscl /Local/Default -create /Groups/zabbix
sudo dscl /Local/Default -create /Groups/zabbix PrimaryGroupID 113
sudo dscl /Local/Default -create /Groups/zabbix Password \*

#To create a user:
sudo dscl /Local/Default -create /Users/zabbix
sudo dscl /Local/Default -create /Users/zabbix UniqueID 113
sudo dscl /Local/Default -create /Users/zabbix UserShell /usr/bin/false
sudo dscl /Local/Default -create /Users/zabbix RealName 'Zabbix user'
sudo dscl /Local/Default -create /Users/zabbix NFSHomeDirectory /var/empty 
sudo dscl /Local/Default -create /Users/zabbix PrimaryGroupID 113
sudo dscl /Local/Default -create /Users/zabbix Password \*

#Create needed directories 
sudo mkdir -p /var/run/zabbix-agent
sudo mkdir -p /var/log/zabbix-agent
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/local/sbin
sudo mkdir -p /usr/local/etc/zabbix

sudo chown -Rf zabbix:zabbix /var/run/zabbix-agent
sudo chown -Rf zabbix:zabbix /var/log/zabbix-agent

sudo chown root:wheel /Library/LaunchDaemons/com.zabbix.zabbix_agentd.plist
sudo chown root:wheel /usr/local/etc/zabbix/zabbix_agentd.conf
sudo chown root:wheel /usr/local/etc/zabbix_agentd.conf

sudo chown -Rf root:wheel /usr/local/sbin
sudo chown -Rf root:wheel /usr/local/bin
sudo chmod -Rf 755 /usr/local/bin
sudo chmod -Rf 755 /usr/local/sbin

sudo chmod 755 /usr/local/etc/zabbix
#sudo kill -9 `ps aux | grep zabbix_agentd | cut -f11 -d" "`
#sudo kill -9 `ps -aef | grep zabbix_agentd | grep -v grep | awk '{print $2}'`
#sudo rm -Rf /tmp/zabbix*
