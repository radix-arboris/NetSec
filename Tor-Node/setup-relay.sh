#!/bin/bash
new_user="tor"
new_pass="toortoor"

before_reboot(){
	sudo adduser $new_user << EOF
	$new_pass
	$new_pass







	EOF

	sudo sed -i '/# User privilege specification/ a\
	tor    ALL=(ALL:ALL) ALL\
	' /etc/sudoers

	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install -fy tor ufw iptables

}

after_reboot(){
	sudo ufw allow 9001
	sudo ufw allow 9030
	sudo ufw allow 22
	sudo ufw allow 222
	sudo ufw allow 80
	sudo ufw enable

	sudo /etc/init.d/tor restart
}

if [ -f /var/run/rebooting-for-updates ]; then
    after_reboot
    rm /var/run/rebooting-for-updates
    update-rc.d myupdate remove
else
    before_reboot
    touch /var/run/rebooting-for-updates
    update-rc.d myupdate defaults
    sudo reboot
fi
