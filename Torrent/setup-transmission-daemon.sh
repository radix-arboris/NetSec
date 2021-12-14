#!/bin/bash
downloads_make_dir="/dbs"
downloads_dir="${downloads_make_dir}/torrent-downloads"
inc_downloads_dir="${downloads_make_dir}/torrent-downloads-incomplete"
mkdir $downloads_dir
mkdir $inc_downloads_dir
sudo apt-get install -y transmission-daemon transmission-cli transmission-common
sudo service transmission-daemon stop
sudo sed -i "s+"rpc-whitelist": "127.0.0.1",+"rpc-whitelist": "127.0.0.1,192.168.*.*",+gi" /etc/transmission-daemon/settings.json
sudo sed -i "s+"download-dir": "/var/lib/transmission-daemon/downloads",+"download-dir": "${downloads_dir}",+gi" /etc/transmission-daemon/settings.json
sudo sed -i "s+"incomplete-dir": "/var/lib/transmission-daemon/Downloads",+"incomplete-dir": "${inc_downloads_dir}",+gi" /etc/transmission-daemon/settings.json
sudo chmod -R 777 $downloads_make_dir
sudo service transmission-daemon start
# need to edit user creds
