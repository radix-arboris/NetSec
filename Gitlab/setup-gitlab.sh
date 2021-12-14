#!/bin/bash

# I have my sub.domain.tld going to a load balacer, and then redirecting
# to the $node_ip on a vlan

node_ip="192.168.0.14"

EXTERNAL_URL="http://${node_ip}"
if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi


apt-get install -fy curl openssh-server ca-certificates apt-transport-https perl
curl https://packages.gitlab.com/gpg.key | sudo tee /etc/apt/trusted.gpg.d/gitlab.asc
apt-get install -y postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/script.deb.sh | sudo bash
apt-get install gitlab-ce

# sed the root password

