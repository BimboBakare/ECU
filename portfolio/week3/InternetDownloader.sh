#!/bin/bash
# InternetDownloader.sh - # prompts users for sitename and filename to download a website to
# Author: 'Bimbo Bakare
# Created as response to 3.5 
# date: 05Feb2022



# Prompt the User to provide a website URL and Directory name to download to

clear
mchoice=0


# start a loop

while [ $mchoice=0 ];
do


echo "Type a website URL to download or EXIT to quit : "
read mchoice


# convert input to uppercase to test if to exit

mchoiceUP=$(echo $mchoice | tr '[:lower:]' '[:upper:]')


if [ "$mchoiceUP" = "EXIT" ];
then
   clear
   echo "Thanks, you will be quiting now"
   read
exit 0


# test that a valid URL has been provided
elif [[ $mchoice =~ http ]] && [[ $mchoice =~ . ]] && [[ $mchoice =~ ://www. ]];
then

   if [ "$mchoice" = 0 ];
   then
      exit 1
   else
      read -p "Type a download location : " mDirectory

      # Check if directory  exists

      if [[ -d "$mDirectory" ]];
      then 

         # Allow write permision on the Directory
         # sudo chmod -R 777 ./"$mDirectory"
         # chown -R $USER:$USER ./"$mDirectory"

         #Use WGET to download the webpage
         #wget -P /"$mDirectory"/Delete.web $mchoice
         wget -P /"$mDirectory"/ $mchoice

      else

         # ask User to provide a valid Directory name

         echo "Directory does NOT exist"

         read -p "Enter a valid Directory name or type 'EXIT' to  exit" mDirectory

         if [ $mDirectory -eq EXIT ];
         then
            quit
         fi

      fi


   fi

else

   clear
   echo "You have provided an INVALID web address"
   exit

fi



done


exit 0




# References:
# 
