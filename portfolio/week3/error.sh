#!/bin/bash
# error.sh Lesson 2.6 - debugging a code
# This scripts is to  test the use of Visual debugger in lesson
# Week2 Lesson 2.6 - Using Debugger to check errors
# Author: 'Bimbo Bakare
# Date: 28012021

secret='shhh' #Don't tell anyone!

read -s -p "what's the secret code?" #receives input from User and reads
# it into the $REPLY 


#if the user types in the correct secret, tell them they got it right!

if [ "$secret" = $REPLY ]; then

    echo "You got it right!"

    correct=true

else     echo "You got it wrong :("

    correct=false

fi


#echo

case $correct in

false)

    echo "Go Away!" #people who get it wrong need to be told to go away!
    exit 44
    ;;

true)

    echo "you have unlocked the secret menu!"

    #TODO: add a secret menu for people in the know.

    echo "Choose a gift from the menu below"
    echo "1. A House"
    echo "2. A car"
    echo "3. Donation to Charity"

    read mgift
    exit 11 #exit code to know the secret was unlocked
    ;;

esac

exit 0


# Reference : Rob MacKnight : Use a debugger to step through scripts to find errors
