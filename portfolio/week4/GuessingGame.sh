#!/bin/bash

# GuessingGame.sh - script uses the getNumber() function in a number guessing game with the following rules:
# Author Bimbo Bakare

clear #clears the screen

echo -e "\033[36mWELCOME TO G U E S S A NUMBER GAME:\033[0m" 

. GetNumbers.sh #calls the GetNumbers script

# loop while Answer is not 42

while [ ! $mAns = 42 ];
do
    if (( $mAns < 42 ));
    then
        echo -e "\n${red}Too low${nc}"
        . GetNumbers.sh
    else
         echo -e "\n\033[34mTOO HIGH:\033[0m" 
        . GetNumbers.sh
    fi

done

echo "Correct"

exit 0

# References:
