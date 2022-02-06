#!/bin/bash
# calculator.sh - This is a calculator for working on two numbers
# Author" Bimbo Bakare
# Date: 03Feb2022

clear

# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'

echo "This is a calculator for two numbers"


# Take user Input

read -p "Enter the first number : " a
read -p "Enter the second number: " b

# Input type of operation
echo "Enter Choice :"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read choice

#Make the User to enter a valid Input
myInput=(1 2 3 4) #Declaring the options available as an array

while [[ ! ${myInput[*]} =~ $choice ]]; 

do 

      # Make the User select a choice between 1 and 4
      read -p "Enter a value between 1 and 4: " choice2

    choice=$choice2;

done


# Switch Case to perform calculator operations
case $choice in
1)
c= $(( $a + $b ))
printf "Answer is : ${blue}$c${nc}%s\n"

;;
2)
c= $(( $a - $b ))
printf "Answer is : ${green}$c${nc}%s\n"

;;
3)
c= $(( $a * $b ))
printf "Answer is : ${red}$c${nc}%s\n"

;;
4)c= $(( $a / $b ))
printf "Answer is : ${purple}$c${nc}%s\n"

;;
esac

exit 0


# References: https://www.geeksforgeeks.org/simple-calculator-bash/

