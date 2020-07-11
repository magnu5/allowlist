#!/bin/bash
# This script will download and add domains from both repos to your whitelist
# Project homepage: https://github.com/Freekers/whitelist
# Licence: https://github.com/anudeepND/whitelist/blob/master/LICENSE
# Created by Anudeep (Slight change by cminion) | Modified by Freekers
#================================================================================
TICK="[\e[32m ✔ \e[0m]"
PIHOLE_LOCATION="/etc/pihole"
GRAVITY_UPDATE_COMMAND="pihole updateGravity"

echo -e " \e[1m This script will download and add domains from both repos to your whitelist \e[0m"
sleep 1
echo -e "\n"

if [ "$(id -u)" != "0" ] ; then
	echo "This script requires root permissions. Please run this as root!"
	exit 2
fi
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/windows10-whitelist | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Windows10 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist-destiny-1.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Destiny1 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist-destiny-2.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Destiny2 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Xbox domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding anudeepND's domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/Freekers/whitelist/master/domains/whitelist.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Freekers' domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/ikea.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Magnu5's IKEA domains to whitelist... \e[0m"
sleep 0.1
echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
mv "${PIHOLE_LOCATION}"/whitelist.txt "${PIHOLE_LOCATION}"/whitelist.txt.old && cat "${PIHOLE_LOCATION}"/whitelist.txt.old | sort | uniq >> "${PIHOLE_LOCATION}"/whitelist.txt

echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
${GRAVITY_UPDATE_COMMAND} > /dev/null
 
echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
echo -e " ${TICK} \e[32m Done! \e[0m"


echo -e " \e[1m  Star us on GitHub, https://github.com/anudeepND/whitelist and https://github.com/Freekers/whitelist \e[0m"
echo -e " \e[1m  Happy AdBlocking :)\e[0m"
echo -e "\n\n"
