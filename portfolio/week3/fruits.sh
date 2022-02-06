#!/bin/bash
# fruits.sh
# Lesson 3.3 Scripts to show a for loop
# Author: 'Bimbo BAKARE
# Date: 03/02/2022


Clear

#Assign fruits into an array
fruits=('Apple' 'Mango' 'Strawberry' 'Orange' 'Banana')


# Using the for command to loop through the array content 
for i in "${fruits[@]}"; do
  echo "FRUIT: $i"
done

exit 0


# References:
# Mcknight, R: Using loops for repetition



