#!/bin/bash
# filename.sh - script goes through each line of a supplied filename and prints determine if a file/directory
# Author: Bimbo bakare
# Date: 14 Feb 2022

clear

# Declaring the colours to use
blue='\033[0;34m'
green='\033[0;32m'
red='\033[0;31m'
purple='\033[0;35m'
nc='\033[0m'

#getFilename() 
      
#{ 
      
#    echo "Filename does not exist" 
#    read -p "Provide a file name " mfilename
      
#} 
     
mfilename="$1" # set the filename to argument from User

#IFS=" "

# Check to test the filename is supplied as an argument

if [ "$#" -ne 1 ]; 

then

	while [ -z $mfilename ]; 
	do
    		
	# If no argument is provided

    echo -e " ${red}Mate, be smart, you haven't entered a Filename \n Kindly type a name ${nc}"
    read mfilename 
     
	#    exit 1
	done

fi

#check if the file exist 

while [ ! -f "$mfilename" ];

do   	

    clear
	echo -e " ${green}Can't find $mfilename mate! \n Please provide a valid filename${nc}"
	read -p " Otherwise type EXIT to quit " mfilename


    if [ ${mfilename^^} = "EXIT" ]; # Takes user out of the module
    then
        clear
        echo -e "${purple}Mate, you will now be EXITing this module ${nc}"
        read

        ./MegaMenu.sh
        exit 1

    fi
done


cnt=1   #Counter for lines in the file

while read line;

do

    myVar=$(echo $line | sed 's/*$//g') # Removes leading and trailing white spaces, if any
 
    if [ ! -z "$myVar" ];   # test if not a blank line
    then
       
        if [[ -f "$myVar" ]];   #If it is a file
        then

            echo -e "Line $cnt - [$myVar] is a File \n"

        elif [[ -d "$myVar" ]]; #if it is a directory
        then

            echo -e "Line $cnt - [$myVar] is a Directory \n"

        else    # if neither a file nor a directory
        
            echo -e "Line $cnt - I don't know what [$myVar] is \n"

        fi

    else

 
        echo -e "Line $cnt - This is an empty line - $myVar \n"  

    fi
    cnt=$((cnt+1))
    
done < $mfilename

echo -e "${blue}You will now be returned to MegaMenu ${nc}"
read

./MegaMenu.sh

exit 0
    
# References: McKnight, R (2022):
