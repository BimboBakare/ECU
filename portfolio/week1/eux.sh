#!/bin/bash
apiPath = "https://api.exchangerate-api.com/v4/latest/EUR"
fileName="index.html"
Browsers= "google-chrome firefox"

if $Browsers
then
google-chrome $fileName&
else
firefox $fileName&
fi

while :;
do

curl -s https://api.exchangerate-api.com/v4/latest/EUR  | jq '.'

done
