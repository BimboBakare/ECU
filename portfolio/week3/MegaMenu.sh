YOU STILL NEED TO FIX THE LOOP SO THAT THE MENU LOOPS AFTER EACH SELECTION
ALSO ENSURE THAT THE  WEEK FOLDER IS WORKING

#!/bin/bash

# MegaMenu.sh - This script takes the result of the passwordCheck.sh to 
# ask the user to make further selections
# Author: Bimbo Bakare
# Date: 07Feb2022


# Run the password.sh script

clear
./passwordCheck.sh
testExit=$? #storing the output of exit variable in the prior script

# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'
nc='\033[0m'

# Making a selection based on the exit code from the  passwordCheck

if [ $testExit -eq 0 ]
then

while [ $? -eq 0 ];
do
# $ echo "$(tput setaf 1)Shirt red $(tput setaf 4) Pant blue"

   # Obtaining input from the user
   printf "${blue}"
   echo  "1. Create a folder "
   echo  "2. Copy a folder "
   echo  "3. Set a password"
   echo  "4. Calculator"
   echo  "5. Create Week Folders - requires more word!${nc}$s\n"
   echo  "6. Check Filenames"
   echo  "7. Download a File"
   printf "${nc}"
   echo  "8. Exit$(tput setaf 7)"
   echo
   read -p "Make an input from 1-7, 8 to EXIT " varUser

   myInput=(1 2 3 4 5 6 7 8) #Declaring the options available as an array

   #Test User input to check if it is  NOT between the array

   while [[ ! ${myInput[*]} =~ $varUser ]]; 

   do 

      # Make the User select a choice between 1 and 7
      read -p "Enter a value between 1 and 8: " varUser2

      echo "$varUser2"

      varUser=$varUser2;

   done


   # Using user input to run the appropriate script


   case $varUser in

     1)
      . ./foldermaker.sh
      ;;

     2)
      ./folderCopier.sh
      ;;

     3)
      ./setPassword.sh
       ;;
     4)
      ./calculator.sh
       ;;
     5)
      read -p "Enter two numbers for the week to be created " var1 var2
      ./megafoldermaker.sh
      ;;
     6)
      ./filename.sh
      ;;
     7)
      ./InternetDownloader.sh
      ;;
     8)
      exit 0

   esac

#   exit 0 # Code to show the script exited normally

# echo "$varUser"
read

done

else

   echo "Goodbye"
   exit 1

fi
  
