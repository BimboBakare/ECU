#!/bin/bash 

#This script compares contents of two folders
# AND DELETE files when found equal



echo "Enter path to MAIN folder ; "
#read  main
main="c:Users/oluwaseun Bakare/Desktop/myapp/ECUMain"


echo "Enter path to OTHER folder: "
#read altfol

altfol="c:Users/oluwaseun Bakare/Desktop/myapp/ECU"

echo $main
echo $altfol
read

echo "Warning - This process is irreversible, files will be DELETED in $main"
echo "Enter 'YES' to  continue and  'NO' to stop"
read cont

cont=$(echo $cont | tr '[:lower:]' '[:upper:]')

noDel=0

if [ $cont == "YES" ];
then
#   cd $main
cd c:/Users/oluwaseun\ bakare/Desktop/myapp/ECUMain  #cd /path/to/Parent
   for f in *; do
      #if [ -f "$f" ] && [ -e "$altfol/$f" ]; then
      if [ -f "./$f" ] && [ -e "$altfol/$f" ]; then
      rm -r "$f" $main/

         echo "$f" >> DELETED.txt
         ((noDel=noDel+1))
      fi  
   done
   echo "$noDel files DELETED from $main :"
   exit 0

else
   echo "No files will be DELETED"
   exit 11
fi

