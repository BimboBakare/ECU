#!/bin/bash
# second.sh - receives input from the command line.
# Author: Bimbo Bakare
# Date:

    # stores the argument received in a variable

    mname="$1"

    if (( $#<1 )); then

       # if a null response is received

        while [ "$mname" = "" ];
        do
             clear

             read -p "Please type your first name : "  mname
       
       done
   fi

echo "Hi there!"
echo "It's good to see you $mname!"

exit 0

# References:
# McKnight, Rob  "1.4 Write and execute simple shell scripts"
