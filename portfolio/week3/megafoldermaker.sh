#!/bin/bash

# Megafoldermaker - Week 3.3 scripts to create folders
# Author 'Bimbo Bakare
# Date: 03/02/2022

clear

# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'
nc='\033[0m'

var1=$1
var2=$2


# If there aren't two arguments to the script

if [ $# -ne 3 ]; then  #Note that when this is called from the MegaMenu, this becomes 3 and not 2

   echo -e "${red}Error, provide two numbers seperated by tab key ${nc}" 
   read mstring

   # Removing any input of ,or. orspace between the two numbers
   mstring=$(echo "$mstring"  | sed 's/[,. ]/ /g')

   IFS=" " read var1 var2 <<< $mstring #turns the string into variables

fi

# test to ensure second file number is greater than the first
while (( $var2 < $var1 ));

do

 clear

 echo -e "${purple}Be smart mate, make second number greater than the first ${nc}"
 read -p "Enter two numbers Smart Mate" var1 var2

done


mCount=0 #counter for number of folders created

#For every number between the first argument and the last

for ((i = $var1; i <= $var2; i++));

do
   #check if that folder exists

   if [ -d week$i ]; then
      echo -e "${red}A folder named ${nc}week$i${red} exists and cannot be overwritten \n Program will skip creating that folder${nc}"
      read

   else
      #Create a new folder for that number

      echo "Creating directory number $i"

      mkdir "week$i"

      mCount=$((mCount+1))

  fi

done

echo -e "${blue}Congratulations, ${green}$mCount${blue} folders have been created for you \n ${nc}You will now EXIT to MegaMenu "

read

./MegaMenu.sh

exit 0

# References
