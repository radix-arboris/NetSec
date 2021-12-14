#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

before_reboot(){
	apt update -y
	apt upgrade -y
	apt install ufw iptables
}

after_reboot(){
        ufw allow 9001
        ufw allow 9030
        ufw allow 22
        ufw allow 222
        ufw allow 80
        ufw allow 53
	ufw enable
}

if [ -f /var/run/rebooting-for-updates ]; then
    after_reboot
    rm /var/run/rebooting-for-updates
    update-rc.d myupdate remove
else
    before_reboot
    touch /var/run/rebooting-for-updates
    update-rc.d myupdate defaults
    reboot now
fi
