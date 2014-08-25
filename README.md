# Zabbix_agentd installer for Mac OS X

These are the source files for packaging a binary zabbix_agentd. The installer itself can be downloaded at the 
releases: https://github.com/mipmip/zabbix_agentd_osx_installer/releases

![image](http://picdrop.t3lab.com/iWcWUQmdaq.png)

## Requirements

* x64 processor
* Mac OS X version = 10.6, 10.7, 10.8, 10.9

## Configuration

Make sure to replace the variables in ```/usr/local/etc/zabbix/etc/zabbix/zabbix_agentd.conf``` after installing and before 
starting the agent deamon.

```
Server=0.0.0.0
Hostname=yourhostname
```

## Usage

The agent starts automaticly at boot time. To start is manually enter:

```
sudo launchctl load /Library/LaunchDaemons/com.zabbix.zabbix_agentd.plist
```

Launchctl unload does not work. Use the command below.
```
sudo kill -9 `ps -aef | grep zabbix_agentd | grep -v grep | awk '{print $2}'`
```

## Build a new zabbix agentd installer

Before you can build an installer pkg you shoud have **xcode command line tools** and **PackageMaker.app** installed.

1. Download the source code from http://zabbix.com tarball
2. Clone this repository
3. Cd to the installer source code
4. Execute ```rake create[/path/to/zabbix_source_code.tar.bz]```
