#!/bin/bash
# filename.sh
# script goes through each line of the filename.txt and prints some results based on outcome


#IFS=" "
# Check to test the filename is supplied as an argument

if [ "$#" -ne 1 ]; then
    # did not an argument
    printf 'No filename provided to check' "$0" >&2
    exit 1
else
    filename= echo "$1"
    lineno=1


    LINES=$(cat $1)
    COUNTER=0

    for LINE in $LINES
    do
       let COUNTER=COUNTER+1

       MM = echo "$LINE"
       if has_substring "$MM" ".sh"
       then
           echo "Indeed, $name contains a script file!"
       fi


name="hello/world"
if has_substring "$name" "/"
then
   echo "Indeed, $name contains a slash!"
fi




done

fi

exit 0

#ins a valid filename, print “That file exists”.
#If that line contains a directory name, print “That’s a directory”.
#Otherwise print “I don’t know what that is!”.
#Test your new script on “filenames.txt”.
