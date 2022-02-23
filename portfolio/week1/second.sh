#!/bin/bash
# second.sh - receives argument from the command line.
# Author: Bimbo Bakare
# Date: 19Jan2022
#!/bin/bash


# get the password input from User without displaying it



    # stores the argument received in a variable

    mname="$1"

    if (( $#<1 )); then

       # if a null response is received, requests ser to enter a name

        while [ "$mname" = "" ];
        do
            clear
            echo -e "\033[36mPlease you did not provide me with your name\n \033[0m"
            read -p "Kindly type your first name here: "  mname
       
       done
   fi

echo "Hi there!"
echo "It's good to see you $mname!"

exit 0

# References:
# McKnight, Rob (nd) "1.4 Write and execute simple shell scripts"
