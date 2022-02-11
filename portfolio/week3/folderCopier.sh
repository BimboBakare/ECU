#!/bin/bash

clear

Cyan='\033[0;36m' 
green='\033[0;32m'
red='\033[0;31m'
nc='\033[0m'



echo -e "${green}Type the name of the folder you would like to copy: ${nc}"
read folderName

# Check if source folder exists

while [ ! -d $folderName ];

do
   echo -e "\n${red}$folderName does not exist and therefore cannot be copied "
   echo -e "Provide a different name or 'EXIT' to exit: ${nc}" 
   read folderName

   # If EXIT is typed, user quits
   
   if [ ${folderName^^} = "EXIT" ]; then

   exit


   fi

done

#copy to a new location

read -p "Type the name of the New Folder: " newfolderName

# Check if destination folder exists and prevent it from being overwritten

while [ -d $newfolderName ];

do
   echo -e "\n${red}$newfolderName exists and therefore cannot be overwritten "
   echo -e "Provide a different name or 'EXIT' to exit: ${nc}" 
   read newfolderName

   # If EXIT is typed, user quits
   
   if [ ${newfolderName^^} = "EXIT" ]; then

   exit


   fi

done

cp -r "$folderName" "$newfolderName"

clear
echo -e "${green}Congratulations $folderName has successfully been copied to $newfolderName "
echo -e "You will now be returned to the MegaMenu${nc}"
read


# Returns to Megamenu
./MegaMenu.sh

exit 0
