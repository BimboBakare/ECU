#!/bin/bash



clear
read -p "type the name of the folder you would like to create" folderName


if [ ! d "$folderName" ];
then
   mkdir "$folderName"
   echo "Folder $folderName has been created"
   exit 0
else
   echo "Folder $folderName exists"
   echo "No folder will be created"
   exit 1
fi
