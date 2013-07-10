#!/usr/bin/env bash

zbxrun="`ps aux | grep zabbix_agentd | grep -v grep | grep -v init_zabbix_agentd | wc -l | tr -d ' '`"
ps aux | grep zabbix_agentd | grep -v grep
echo $zbxrun
if [ $zbxrun -gt 0 ] ; then
	echo "zabbix is running. Stopping now"

else
	echo "zabbix is not running. Starting now"
fi
