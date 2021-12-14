#!/bin/bash

### Make sure to create/change cache dir and cache size if neeeded ###

example_username="pr0xyb01"
example_password="g1mm131nt3rn3tp7s"
squid_version=""
conf_file="/etc/squid${squid_version}/squid.conf"
cred_file="/etc/squid${squid_version}/creds.txt"
sudo apt update
sudo apt install squid
sudo systemctl enable squid
sudo cp confs/squid.conf $conf_file
sudo touch $cred_file && chmod 777 $cred_file
sudo htpasswd -b -c /etc/squid/creds.txt $example_username $example_password
sudo systemctl restart squid
sudo systemctl status squid
