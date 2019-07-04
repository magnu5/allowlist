#!/bin/bash
# This script will download and add domains from both repos to your whitelist
# Project homepage: https://github.com/Freekers/whitelist
# Licence: https://github.com/anudeepND/whitelist/blob/master/LICENSE
# Created by Anudeep (Slight change by cminion) | Modified by Freekers
#================================================================================
TICK="[\e[32m ✔ \e[0m]"
WHITELIST_LOCATION="/home/pi"


echo -e " \e[1m This script will download and add domains to your whitelist.txt, but You will have to add them yourself using the web interface. \e[0m"
sleep 1
echo -e "\n"

curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/windows10-whitelist | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Windows10 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist-destiny-1.txt | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Destiny1 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist-destiny-2.txt | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Destiny2 domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/magnu5/Whitelist/master/xbox-whitelist.txt | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Magnu5's Xbox domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding anudeepND's domains to whitelist... \e[0m"
sleep 0.1
curl -sS https://raw.githubusercontent.com/Freekers/whitelist/master/domains/whitelist.txt | tee -a "${WHITELIST_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding Freekers' domains to whitelist... \e[0m"
sleep 0.1
echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
mv "${WHITELIST_LOCATION}"/whitelist.txt "${WHITELIST_LOCATION}"/whitelist.txt.old && cat "${WHITELIST_LOCATION}"/whitelist.txt.old | sort | uniq >> "${WHITELIST_LOCATION}"/whitelist.txt

echo -e " ${TICK} \e[32m Parsing file for AdguardHome... \e[0m"
sed -i 's/^/@@||/' "${WHITELIST_LOCATION}"/whitelist.txt
echo -e " ${TICK} \e[32m Done! \e[0m"


echo -e " \e[1m  Star us on GitHub, https://github.com/anudeepND/whitelist, https://github.com/Freekers/whitelist and https://github.com/magnu5/whitelist-1 \e[0m"
echo -e " \e[1m  Happy AdBlocking :)\e[0m"
echo -e "\n\n"
