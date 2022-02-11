#!/bin/bash

clear

# Declaring colours for use

Cyan='\033[0;36m' 
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'


echo -e "${Cyan}Type the name of the folder you would like to create:  ${nc}" 
read folderName

# test if folder currently exists

while [ -d $folderName ];

do
   echo -e "\n${red}This folder currently exists and cannot be over-written${nc}"
   read  -p "Provide a different name or 'EXIT' to exit: " folderName

   # If EXIT is typed, user quits
   
   if [ ${folderName^^} = "EXIT" ]; then

   exit


   fi

done
 

mkdir "$folderName"
clear
echo  "Congratulatins $folderName has been created "
echo  "You will now return to the MegaMenu"
read

# returns to MegaMenu script
./MegaMenu.sh 


exit 0
