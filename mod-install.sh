#!/bin/bash
clear
echo -e "\n The following questions require a y/n answer...\n"

read -p "Create a WiFi Router? " ans1
if [ -z $ans1 ]
then
echo "Answer Empty..."
exit
fi
read -p "Install Pi-Hole?" ans2
if [ -z $ans2 ]
then
echo "Answer Empty..."
exit
fi
read -p "Install Wireguard VPN? " ans3
if [ -z $ans3 ]
then
echo "Answer Empty..."
exit
fi
read -p "Install Squid Proxy? " ans4
if [ -z $ans4 ]
then
echo "Answer Empty..."
exit
fi
read -p "Create a Torrenting Server/Seedbox? " ans5
if [ -z $ans5 ]
then
echo "Answer Empty..."
exit
fi
read -p "Install Plex (requires Ubuntu)? " ans6
if [ -z $ans6 ]
then
echo "Answer Empty..."
exit
fi
read -p "Create a Tor Relay? " ans7
if [ -z $ans7 ]
then
echo "Answer Empty..."
exit
fi
read -p "Create a Tor Router? " ans8
if [ -z $ans8 ]
then
echo "Answer Empty..."
exit
fi

wf="Normal-Router"
ph="Pi-Hole"
wg="Wireguard"
sq="Squid"
to="Torrent"
pl="Plex"
tn="Tor-Node"
tr="Tor-Router"

if [ $ans1 == "y" ]
then
	bash ${wf}/install.sh
elif [ $ans2 == "y" ]
then
	bash ${ph}/install.sh
elif [ $ans3 == "y" ]
then
        bash ${wg}/install.sh
elif [ $ans4 == "y" ]
then
        bash ${sq}/install.sh
elif [ $ans5 == "y" ]
then
        bash ${to}/install.sh
elif [ $ans6 == "y" ]
then
        bash ${pl}/install.sh
elif [ $ans7 == "y" ]
then
        bash ${tn}/install.sh
elif [ $ans8 == "y" ]
then
        bash ${tr}/install.sh
else
fi
