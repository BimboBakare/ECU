#!/bin/bash
# ipinfo.sh - script to used sed command to manipulate the ifconfig


# get info about networking from the ifconfig command 
      
net_info="$(ifconfig)"  #the bracket helps turns the command into a variable
      
#parse out the ip address lines using sed 
# note the use of \n\t below for newline and space in formatting
# the s in sed is to replace and p is to print# the initial -n flag in the sed command is to suppress print
      
addresses=$(echo "$net_info" | sed -n '/inet / { 
      
s/inet/IP Address:/ 

s/netmask/\n\t\tSubnet Mask:/ 
      
s/broadcast/\n\t\tBroadcast Address:/  
      
p 
      
}') 
      
#format output 
      
echo -e "IP addresses on this computer are:\n$addresses"  # notice the \n for newline

exit 0

# References:
# McKnight, R: 4.5 Write scripts that can parse text in a meaningful way
