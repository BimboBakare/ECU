#!/bin/bash
# function.sh - create usable functions for coding
# Author Bimbo Bakare
# Date 08Feb2022

red='\033[31m'
nc='\033[0m' # No Color


# This function gives a printerror
printError() 
{ 
    echo -e "\033[31mERROR:\033[0m $1" 
} 


getmPass()
{
    while [ -z "$mPass" ]
    do
        echo "Please enter a Password:" >&2  # redirect to stderr (2 is stderr, 1 is stdout and 0 is stdin)
        read -s mPass1
        echo "Please re-enter the Password to confirm:" >&2
        read -s mPass2

        if [ "$mPass1" = "$mPass2" ]; then
            mPass=$mPass1
        else
            # Output error message in red
            echo -e "\n${red}The Passwords entered do not match!${nc}" >&2  #n newline
        fi
    done
    echo "$mPass"
}

   
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
      
{ 
    
    read -p "$1: " 
    

    while (( $REPLY < $2 || $REPLY> $3 )); do 
      
        printError "Input must be between $2 and $3" 
      
        read -p "$1: " 
        
    done 
    
    mAns=$REPLY
} 
      
      
#echo "This is the start of the script" 
    
getNumber "please type a number between 1 and 100" 1 100 
      
#echo "Thank you! "

#getNumber "please type a number between 50 and 100" 50 100 
      
#echo "Thank you!" 


     