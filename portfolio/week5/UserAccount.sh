#!/bin/bash
# UserAccounts.sh - look at the “etc/passwd” file and format it into a neat table similar to the one from tas>
# Author Bimbo Bakare
# Date 15Feb 2022

clear

# using the field separator of colon to prints the first field in every line 

echo "System's Users Home Directory"

awk 'BEGIN {

    FS=":";

 print "| \033[34mUserName           \033[0m | \033[34mUserID\033[0m |\033[34mGroupID \033[0m | \033[34m Home                              \033[0m | \033[34m Shell           \033[0m |"; 

     print "___________________________________________________________________________________________________";


}

{

# Setting the Format - Colours and length

printf("|\033[33m%-20s\033[0m | \033[35m%-6s\033[0m |\033[35m%-8s\033[0m | \033[35m%-35s\033[0m | \033[35m%-17s\033[0m |\n", $1, $3, $4, $6, $7);


}

END {
    print "___________________________________________________________________________________________________";
#end awk by printing footer line

}' /etc/passwd





# References:
# 1. https://www.gnu.org/software/gawk/manual/html_node/Printf-Examples.html
