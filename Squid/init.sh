#!/bin/bash

### Make sure to create/change cache dir and cache size if neeeded ###
### http_port is set to 3333 ###
### use the provided username and password examples to authenticate connection to the proxy ###
### or replace the credentials with your own ###

if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi

example_username="pr0xyb01"
example_password="g1mm131nt3rn3tp7s"
squid_version=""
conf_file="/etc/squid${squid_version}/squid.conf"
cred_file="/etc/squid${squid_version}/creds.txt"
apt update
apt install -fy squid apache2-utils
systemctl enable squid
cp confs/squid.conf $conf_file
touch $cred_file && chmod 777 $cred_file
htpasswd -b -c /etc/squid/creds.txt $example_username $example_password
systemctl restart squid
systemctl status squid
