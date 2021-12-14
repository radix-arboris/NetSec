#!/bin/bash
clear
lol=$1

if [ -z "$lol" ]; then
clear
echo -e "!!! Wordlist File Empty !!!\n"
echo -e " Usage: whitelist.sh {file}"
exit
fi

mainfile = "/etc/pihole/whitelist.txt"
tmp1 = "/etc/pihole/whitelist-tmp1.txt"
tmp2 = "/etc/pihole/whitelist-tmp2.txt"

echo "Importing wordlists from $lol"
while read -r line; do
    sudo echo "$line" >> $tmp1
done < $lol

sudo uniq $tmp1 >> $tmp2

while read -r line; do
    sudo echo "$line" >> $mainfile
done < $tmp2

sudo rm -rf $tmp1
sudo rm -rf $tmp2

pihole -g

reboot now
