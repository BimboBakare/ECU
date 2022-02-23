#!/bin/bash
# passwordCheck.sh - Check user’s password against the hash stored in 'secret.txt'
# Author: Bimbo Bakare
# Date: 24Jan2022
# Note: The right password is nancy

# get the password input from User without displaying it
clear

# Declaring the colours to use

Cyan='\033[0;36m' 
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'

# User friendliness , set output colour

printf "${red}"
read -sp  "Enter password here : " mpassword

# check if the passwordfile containing the hash exists

if [ ! -f ./password/secret.txt ]; then

   clear
   echo -e "${Cyan}Please contact your IT Unit"
   echo -e "Report ${red}ERROR 44${Cyan}"
   echo -e "You will now exit the  application${nc}"
   exit 44

fi

# hashes the suplied password and compare with passwordfile
echo "$mpassword" | sha256sum -c "./password/secret.txt" &> /dev/null #silencing the output

mval="$?"

   if [ $mval = 0 ]; then
      echo -e  "${green}Access Granted${nc}"
      exit 0
   
   else
      echo -e "${red}Access Denied${nc}"
      exit 1
   fi
printf "${nc}"

# References:
# McKnight, R (2022, Feb 06). 2.4 Write if statements to control program flow
# https://blackboard.ecu.edu.au/webapps/blackboard/execute/displayLearningUnit?course_id=_662967_1&content_id=_8274249_1

