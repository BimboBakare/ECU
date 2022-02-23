
#!/bin/bash 
# DictionaryAttack.sh - tarts with a hidden password in sha256 (just like in week 2). It then uses a for loop and the cat command to go through 
#                       each line of a wordlist file and uses sha256sum to create a password hash from it. 
#                       This is then formatted using awk and compared against the hidden password hash. 
#                       The process is repeated until the password is found.
# Author Bimbo Bakare
# Date 19Feb2022

      
#hidden password hash 
      
passwordHash="8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52";
      
# for each line in the file 
      
for word in $(cat wordlist.txt); do 

    # hash the word 

    wordlistHash=$(echo -n $word | sha256sum | awk '{ print $1; }')


    echo "Trying $word: $wordlistHash"
      
    #if the hash is the same as the correct password's hash then we have cracked the password!

    if [ $wordlistHash = $passwordHash ]; then 
      
        echo "Password has been cracked! It was $word" 
      
        exit 0 
      
    fi 

      
done 
      
exit 1 


# Reference: McKnight, Rob (2022) 
     