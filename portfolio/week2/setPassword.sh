#!/bin/bash

#Code to get passwords from Users

# Foldername Input is gotten from user
read -p "Enter a folder Name: " varFolder

#Folder password is received and hidden from user
read -sp "Enter Password: " varPassw

#Directory is Created with the name given by User
mkdir "$varFolder"

#The system changes into the newly created directory and creates a secret.txt file
cd ./"$varFolder"/
echo "$varPassw" > secret.txt

#command to show the program exited without error
exit 0

