#!/bin/bash

# get the password input from User without displaying it
echo "Enter password here :"
read -s password

# hash the password received 


hashPass="$(echo "$password" | sha256sum)"



# Check if the hash exists in a file already

if grep -w "$hashPass" ./YayaAbdul/secret.txt # The w is to check exact word
then
   echo  "Access Granted"
   exit 0
   
else
   echo  "Access Denied"
   exit 1
fi
