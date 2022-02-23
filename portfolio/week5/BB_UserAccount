#!/bin/bash
# UserAccounts.sh - look at the “etc/passwd” file and format it into a neat table similar to the one from tas>
# Author Bimbo Bakare
# Date 15Feb 2022

clear

# using the field separator of colon to prints the first field in every line 
   
echo "System's Users Home Directory" 
      
awk 'BEGIN { 
      
    FS=":"; 
      
    print "_______________________________________________________________"; 


# Setting the Format - Colours and length
format = ("| \033[33m%-21s\033[0m | \033[35m%-7s\033[0m | \033[35m%-7s\033[0m | \033[35m%-23s\033[0m| \n")

printf format, "Name", "User ID","User No", "Home Dir" #print Header Row


#FIELDWIDTHS="23 10 7 9 15 18 34"
}

{

if($5!="") # Remove rows where the UserName is Blank

{

#for(i=1;i<=NF-1;i++); #setting file limits


#printf("| \033[33m%-21s\033[0m | \033[35m%-7s\033[0m | \033[35m%-7s\033[0m |\033[35m%-23s\033[0m |\n",$5,$1,>

# printing the rows of data
printf format, $5, $1 , $3, $6;

}

} 
      
END { 
      
    print("________Bimbo Bakare_______E___N___D_______________________"); 



      
}' /etc/passwd
     

     # References:

     # 1. https://www.gnu.org/software/gawk/manual/html_node/Printf-Examples.html
