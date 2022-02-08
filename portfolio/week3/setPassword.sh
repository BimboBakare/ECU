#!/bin/bash
#setPassword.sh Code to get passwords from Users
# 
# Author: Bimbo Bakare



# Foldername Input is gotten from user
clear
read -p "Enter a folder Name: " varFolder


#Folder password is received and hidden from user
read -sp "Enter Password: " varPassw
read -sp "Enter Passwor again: " varPassw2


#tests that the user is sure of the  password entered.

while [ ! "$varPassw" = "$varPassw2" ];
do

   clear
   read -sp "Your passwords do not match, kindly re-enter: " varPassw
   read -sp "Re-enter password to confirm : " varPassw2

done

# Check if Directory already exists

   if [ ! -d "$varFolder" ];
   then
    
      #Directory is Created with the name given by User
   
      mkdir "$varFolder"

   fi

#The system changes into the newly created directory and creates a secret.txt file
# cd ./"$varFolder"/

# hashes the password inputed by User and save in a file

echo "$varPassw" | sha256sum > ./"$varFolder"/secret.txt


#command to show the program exited without error
exit 0

