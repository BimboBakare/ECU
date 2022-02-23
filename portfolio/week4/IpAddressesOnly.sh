#!/bin/bash
# 4IpAddressesOnly.sh - executes the IpInfo.sh script and uses sed to display
# only lines with IP Addresses
# Author: Bimbo Bakare
# Date: 10Feb2022

clear
green='\033[0;32m'
nc='\033[0m'


# Pipes the outut of ipinfo.sh intoo sed to replace IP Address

mIpAddrss=$(echo -e  "$(./ipinfo.sh)"  | sed -n '/IP Address/p' )

echo -e "Here is the list of your IP Adddresses\n\n"
echo -e "${green}$mIpAddrss${nc}\n\n"
echo "Press Enter to Exit"
read
clear
# echo $(./ipinfo.sh > ipadd.txt)

# # Reads the file with sed and prints out only lines with "IP Address"

# sed -n '/IP Address/p' ipadd.txt


exit 0

# References:
# McKnight, R: 4.5 Write scripts that can parse text in a meaningful way
