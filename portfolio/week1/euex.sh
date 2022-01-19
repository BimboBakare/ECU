#!/bin/bash
apiPath = "https://api.exchangerate-api.com/v4/latest/EUR"
fileName="index.html"
Browsers= "google-chrome firefox"


NGN=$((curl -s $apiPath  | jq '.rates.NGN') | sed 's/"//g')
GBP=$((curl -s $apiPath  | jq '.rates.GBP') | sed 's/"//g')
cat > $fileName <<- _EOF_

exit 0

