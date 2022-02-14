#!/bin/bash
# regexes.sh - scripts
# Author Bimbo Bakare
# Date: 12 Feb 2022



cd ~/scripts

grep -r  ' sed state*' # all sed statements

grep -r "^m"   # all lines that start with the letter m

grep -r '[0-9][0-9][0-9]' #all lines that contain three digit numbers 

grep -r '^echo ".*\w\w*' # Allecho statements with three or more words






 
Show only statements that contain an echo with a flag.  
 

grep -r 'echo -.*'  

copy toclipboard 
Show only echo statements where the text is in double quotes and starts with an uppercase letter.  
 

grep -r 'echo .*\"[A-Z].*\"'  

Create a script named “regexes.sh” and write grep -r statements to search your work for the following patterns:  

    all sed statements 

    all lines that start with the letter m 


    all echo statements with at least three words 

    all lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password). 
