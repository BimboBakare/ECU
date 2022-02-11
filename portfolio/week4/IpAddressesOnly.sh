#!/bin/bash
# 4IpAddressesOnly.sh - executes the IpInfo.sh script and uses sed to display
# only lines with IP Addresses
# Author: Bimbo Bakare
# Date: 10Feb2022


# Writes the output of the ipinfo.sh to a file


echo $(./ipinfo.sh > ipadd.txt)

# Reads the file with sed and prints out only lines with "IP Address"

sed -n '/IP Address/p' ipadd.txt


exit 0

# References:
# McKnight, R: 4.5 Write scripts that can parse text in a meaningful way
