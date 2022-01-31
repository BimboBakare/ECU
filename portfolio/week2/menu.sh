#!/bin/bash

#This script takes the result of the passwordCheck.sh to 
# Ask the usertto make further selections

# Run the password.sh script

clear
./passwordCheck.sh


testExit=$? #storing the output of exit variable in the prior script

# Making a selection based on the exit code from the  passwordCheck

if [ $testExit -eq 0 ]
then

   # Obtaining input from the user

   echo  "1. Create a folder "
   echo  "2. Copy a folder "
   echo  "3. Set a password"

   read varUser

   myInput=(1 2 3) #Declaring the options available as an array

   #Test User input to check if it is  NOT between 1 and 3

   while [[ ! ${myInput[*]} =~ $varUser ]]; 

   do 

      # Make the User select a choice between 1 and 3
      read -p "Enter a value between 1 and 3: " varUser2

      echo "$varUser2"

      varUser=$varUser2;

   done


   # Using user input to run the appropriate script


   case $varUser in

     1)
      ./folderMaker.sh
      ;;

     2)
      ./folderCopier.sh
      ;;

     3)
      ./setPassword.sh
       ;;

   esac

   exit 0 # Code to show the script exited normally


else

   echo "Goodbye"
   exit 1

fi
  
