#!/bin/bash

read -p "type the name of the folder you would like to create" folderName

mkdir "$folderName"
clear
echo "$folderName has been created "
echo "You will now EXIT the program"
read
exit 0