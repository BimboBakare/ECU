#!/bin/bash
# calculator.sh - This is a calculator for working on two numbers
# Author: 'Bimbo Bakare
# Date: 03Feb2022

clear

mc=0
while [ $mc = 0 ];

# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'
nc='\033[0m'

echo -e "This is a calculator for two numbers\n"


# Take user Input

do

read -p "Enter the first number : " a
read -p "Enter the second number: " b

# Input type of operation
echo -e "${purple}Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division${nc}"
#echo "Type 'EXIT' to close"
read choice

#Make the User to enter a valid Input
myInput=(1 2 3 4) #Declaring the options available as an array

while [[ ! ${myInput[*]} =~ $choice ]]; 

do 

      # Make the User select a choice between 1 and 4
      read -p "Enter a value between 1 and 4 or type 'EXIT' to close: " choice2

     choice=$choice2;

     if [ ${choice2} = "EXIT" ]; then
        echo "You will now return to MegaMenu"
        read
        ./MegaMenu.sh
     fi


done


# Switch Case to perform calculator operations
case $choice in
1)c=$(( a + b ))
printf "Answer is : ${blue}$c${nc}%s\n"

;;
2)c=$(( a - b ))
printf "Answer is : ${green}$c${nc}%s\n"

;;
3)c=$(( a * b))
printf "Answer is : ${red}$c${nc}%s\n"

;;
4)c=$(( a / b ))
printf "Answer is : ${purple}$c${nc}%s\n"
;;
esac

read -p "Press any key to try other numbers or type 'EXIT' to close" mExit


     if [ ${mExit} = "EXIT" ]; then
        echo -e "You will now return to MegaMenu\n"
        echo "Thanks for using our calculator"
        echo "You will now EXIT to MegaMenu"

        ./MegaMenu.sh

     fi

clear

done


#echo "$#"

exit 0


# References: https://www.geeksforgeeks.org/simple-calculator-bash/

