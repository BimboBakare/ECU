#!/bin/bash
#setPassword.sh Code to get passwords from Users
# 
# Author: Bimbo Bakare



# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'
nc='\033[0m'

# Foldername Input is gotten from user
clear
echo -e "${blue}Enter a folder Name: ${nc}" 
read varFolder


#Folder password is received and hidden from user
 echo -e "${green}Enter Password: "
 read -s varPassw
 echo -e  "Enter Passwor again: ${nc} \n"
 read -s varPassw2


#tests that the user is sure of the  password entered.

while [ ! "$varPassw" = "$varPassw2" ];
do

   clear
   ${red}
   read -sp "Your passwords do not match, kindly re-enter: " varPassw
   read -sp "Re-enter password to confirm : " varPassw2
   ${nc}
done

# To prevent Dictionary attack, Checks password for combination of Upper and lower case characters

mpass="weak"

while [ ! "$mpass" = "strong" ];
do
   if [[ $varPassw =~ [A-Z] ]] && [[ ! $varPassw =~ ^[[:alnum:]]+$ ]]; then

      mpass="strong"

   else

      echo -e "${red}Your password is not strong enough \n You will now exit and enter a strong password${nc}"
      read
      exit 22

   fi

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

echo -e "${purple}Congratulations!!! Your password has been stored in \n${green}$varFolder/secret.txt"
echo -e "${purple}Press any key to return${nc}"
read


#command to show the program exited without error
exit 0



# References:
# 1. Geeks for Greeks: https://www.geeksforgeeks.org/check-if-a-string-contains-uppercase-lowercase-special-characters-and-numeric-values/
# awk  “^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)” + “(?=.*[-+_!@#$%^&*., ?]).+$” 
# where, 
# ^ represents the starting of the string.
# (?=.*[a-z]) represent at least one lowercase character.
# (?=.*[A-Z]) represents at least one uppercase character.
# (?=.*\\d) represents at least one numeric value.
# (?=.*[-+_!@#$%^&*., ?]) represents at least one special character.
# . represents any character except line break.
# + represents one or more times.