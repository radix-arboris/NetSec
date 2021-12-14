#!/bin/bash
clear
lol=$1

if [ -z "$lol" ]; then
clear
echo -e "!!! Wordlist File Empty !!!\n"
echo -e " Usage: blacklist.sh {file}"
exit
fi

echo "Importing wordlists from $lol"
while read -r line; do
    sudo sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ('$line', 1, 'comment');"
done < $lol

pihole -g

reboot now
