#!/bin/bash
# webscraper.sh- Checks the AustCyber website and returns the list of Alerts issued, the date and criticality levels
# Author Bimbo Bakare
# Date 20Feb2022


curl=$(which curl)
output="output.txt"
mtitle=$(echo $mtitle | tr ' ' '+')
mbody_value=$(echo $mbody_value| tr ' ' '+')

# dump webpage
function download_page() {
    $curl -o $output $url
    $curl -o "delete.txt" $url2
    cat delete.txt >> $output
    web_error
}

# checking for errors
function web_error() {
    if [ $? -ne 0 ]; then
        echo "Error downloading page"
        exit -1
    fi

}


# this cleans up the downloaded data in the output file and save in the temp.txt file

function clean_html() {

    grep '<p class="' $output | sed '
    
        
        s/<div class="field.*<\/div>//g;
        s/"acsc-title">/Advisory Title : /g;
        s/"acsc-summary">/Warning : /g;
        s/<p class=//g;
        s/"acsc-date">/DATE ISSUED : /g;
        s/<strong>Alert status: <span class="alert-.*"/CRITICALITY/g;
        s/<\/span>//g;
        s/<\/strong>//g;
        s/<\/p>/\n/g' > temp.txt

    clear
        
}


# This function creates a table to present summarised data

function txt_man () {

    sed '

    s/.*<div class.*//g;
    s/<\/div>//g;
    s/- CRITICALITY>/:/g;

    ' temp.txt | sed '/^$/d' | awk -F: '{ print $1 $2  $3}' > delete.txt

    awk ' $1 ~ /^DATE/ {print $1" :" $3" :" $4" :" $5" :"$6} ' delete.txt  > temp.txt 

    # | awk 'BEGIN{FS=OFS=""}{$n = $n OFS":" 1}1' #To create new column

    awk 'BEGIN {

      FS=":";

        print "| \033[32mDAY \033[0m | \033[32mMonth \033[0m |\033[32mYEAR \033[0m | \033[32mCriticality\033[0m |"; 

        print "______________________________________";

    }

    {

        # Setting the Format - Colours and length

        printf("|\033[33m%-4s\033[0m | \033[35m%-6s\033[0m |\033[35m%-6s\033[0m | \033[35m%-9s\033[0m |\n", $2, $3, $4, $5, $6);

    }

    END {
        print "__________________________________________";
        #end awk by printing footer line

    }' temp.txt


}


# This function tests Users Input to ensure it is within allowed selection 


function user_choice() {


      while [[ ! [$@] =~ $varUser ]]; 
      do 

         # Make the User select a choicewithin the arguments passed\

         read -p "Enter a value amongst -\"$*\" " mvarUser
         echo "$mvarUser"
         varUser=$mvarUser;

      done

}

# This functions summarizes the data by Criticality of Alert

function summ() {

txt_man

echo -e "\033[32m\n\nCriticality Grouping of Issued Advisories\033[0m\n"

awk -F":" -i inplace '{ for(N=1; N<=NF; N++) if($5=="") $5="NA" }1' temp.txt 


 printf "| \033[32mcriticality\033[0m | \033[32mNumber\033[0m |\n"; 

     printf "_________________________\n";
    

awk '{
    crc[$5]++;
          
    }
    
    END{
        for (var in crc)
          
           # print var, "Number", crc[var]," times"
           #  print var, crc[var]


    printf("|\033[33m%-12s\033[0m | \033[35m%-6s\033[0m |\n", var, crc[var]);


    }' temp.txt


}

#######################
#  Main Code Section  #
#######################

clear

echo -e "------------CYBER SECURITY ALERTS--------------\n\n "   
echo -e "\033[36mWelcome, this module provides you with up-to-date Advisories on Cyber Security "
echo -e "threats as have been issued by theAustralian Cyber Security centre, an outreach"
echo -e "of the Australian Signals directorate of the Australian Government. \n\n "
echo -e "Please note that this is NOT an Australian Government endorsed app\n "
echo -e "The provider claims no responsibility for the information provided\n \n \033[0m"
echo -e "Kindly press the ENTER key to continue"
read

# receives User's Inputs on the Search to be done
clear
echo -e "\033[35m TITLE SEARCH FOR ADVISORIES\n"
read -p "Enter the words you want to search for in the Title of advisory - " mtitle
echo -e "\nWhat type of Title Search Do you want carried out:"
echo -e "1. Is Equal to all words"
echo -e "2. Contains any words"
echo -e "3. Contains all words"
echo -e "4. ALL ADVISORIES TO DATE\n\033[0m"
read varUser

if [ "$varUser" = "" ]; then
    varUser=0
fi

# Restrict User to choose between 1 and 4

user_choice 1 2 3 4
mtitle_op=$varUser

# myInput=(1 2 3 4) #Declaring the options available as an array

# while [[ ! ${myInput[*]} =~ $mtitle_op ]]; 
# do 

#    read -p "Enter a value between 1 and 4 or type 'EXIT' to close: " mtitle_op2

#      mtitle_op=$mtitle_op2;

#      if [ ${mtitle_op2} = "EXIT" ]; then
#         echo "You will now EXIT"
#         read
#         exit 11
#      fi


# done

# passing the choice made by the user to the script

case $mtitle_op in

  1)
      mtitle_op="%3D"
    ;;

  2)
    mtitle_op="word"
    ;;

  3)
    mtitle_op="allwords"
    ;;

  *)
    mtitle_op=""
    ;;

esac


if [ ! $mtitle_op = "" ]; then

    echo -e "\033[31mCONTENT SEARCH AS ADDITIONAL FILTER FOR ADVISORIES"
    read -p "Enter the words you want to filter for in the CONTENT of advisory - " mbody_value
    echo -e "What type of Filtering do you want carried out:"
    echo -e "1. Contains any words"
    echo -e "2. Contains all words\033[0m"
    read varUser

    if [ "$varUser" = "" ]; then
        varUser=0
    fi

    # Restrict User to choose between 1 and 2

    user_choice 1 2
    mbody_value_op=$varUser

    # myInput=(1 2) #Declaring the options available as an array

    # while [[ ! ${myInput[*]} =~ $mbody_value_op ]]; 

    # do 

    # read -p "Enter a value between 1 and 2 or type 'EXIT' to close: " mbody_value_op2

    #     mbody_value_op=$mbody_value_op2;

    #     if [ ${mbody_value_op2} = "EXIT" ]; then
    #         echo "You will now EXIT"
    #         read
    #         exit 11
    #     fi

    # done

    if [ $mbody_value_op = "1" ]; then
        mbody_value_op="word"
    else
        mbody_value_op="allwords"
    fi

    url="https://www.cyber.gov.au/acsc/view-all-content/alerts%26advisories?title_op=$mtitle_op&title=$mtitle&body_value_op=$mbody_value_op&body_value=$mbody_value&sort_by=title&sort_order=DESC"


else  # To search for all advisories ever issued

    #url="https://www.cyber.gov.au/acsc/view-all-content/alerts%26advisories?title_op=word&title=&body_value_op=word&body_value=&sort_by=field_date_user_updated_value&sort_order=DESC"


    url="https://www.cyber.gov.au/acsc/view-all-content/alerts?title_op=word&title=&body_value_op=word&body_value=&sort_by=field_date_user_updated_value&sort_order=DESC&page=1"
    url2="https://www.cyber.gov.au/acsc/view-all-content/alerts?title_op=word&title=&body_value_op=word&body_value=&sort_by=field_date_user_updated_value&sort_order=DESC&page="
fi 


download_page

clean_html

myInput=(1 2 3) #Declaring the options available as an array

echo -e "\033[36mHERE ARE YOUR AUSTCYBER ALERTS \033[0m\n\n"
echo -e "\033[31mEnter 1 to view all type advisories"
echo -e "Enter 2 to view the Criticality Summary per date"
echo -e "Enter 3 to view Total Criticality Summary\033[0m"
read mtitle_op

while [[ ! ${myInput[*]} =~ $mtitle_op ]]; 
do 

   read -p "Enter a value between 1 and 3 :" mtitle_op2

     mtitle_op=$mtitle_op2;

done

# passing the choice made by the user to the script

case $mtitle_op in

  1)
    clear
    cat temp.txt
    ;;

  2)
    clear
    txt_man
    ;;

  *)
   clear
   summ
    ;;

esac

echo -e "\033[32m\n\nEnd of file\nYou will now EXIT this app\033[0m"
read
clear
exit 0



##########################
##        NOTE          ##
## see Report Attached  ##
##########################


