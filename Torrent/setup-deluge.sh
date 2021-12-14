#!/bin/bash
new_sys_user_pass="toortoor"
new_sys_home_dir="/var/lib/deluge"
new_deluge_server_user="dev"
new_deluge_sever_pass="toor"
sudo apt update
sudo apt install -fy deluged deluge-console python3-mako deluge-web
sudo adduser deluge --home /var/lib/deluge << EOF
$new_pass
$new_pass







EOF

usermod -a -G deluge deluge
mkdir /var/lib/deluge
chown -R deluge:deluge /var/lib/deluge
sudo -u deluge deluged

#sudo -u deluge deluge-console << EOF
#config -s allow_remote True
#
#exit
#
#EOF

#ps aux | grep deluged
#kill -9 $p_id

sudo -u deluge echo "${new_deluge_server_user}:${new_deluge_sever_pass}:10" >> /var/lib/deluge/.config/deluge/auth
cat >> /etc/systemd/system/deluged.service << EOF
[Unit]
Description=Deluge Bittorrent Client Daemon
Documentation=man:deluged
After=network-online.target

[Service]
Type=simple
User=deluge
Group=deluge
UMask=007
ExecStart=/usr/bin/deluged -d
ExecStart=/usr/bin/deluge-web &
Restart=on-failure
# Time to wait before forcefully stopped.
TimeoutStopSec=300

[Install]
WantedBy=multi-user.target

EOF

systemctl start deluged
systemctl enable deluged

#
#sudo -u pi /usr/bin/python /usr/bin/deluged
#sudo -u pi /usr/bin/python /usr/bin/deluge-web &
