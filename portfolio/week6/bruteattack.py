#!/usr/bin/python3 
# bruteattack.py - python script for dbruteforce attack using combinations of letters in the alphabet and numbers
# Author Bimbo Bakare
# Date 22Feb2022

# Libraries to aid in the atack
from pkg_resources import WorkingSet
import itertools
import time
import hashlib
import bcrypt


# Specifying the characters to use for the bruteforce attack, as opposed to a dictionary
Alphabet = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.!")

# Receives passwordinput from user
Password = input("What is your password?\n")

# hashes the password using bcrypt
hashed_password = bcrypt.hashpw(password.encode('utf8'), bcrypt.gensalt())

# convert to string with correct format
string_password = hashed_password.decode('utf8')


start = time.time()

mcount = 1
CharLength = 1


for CharLength in range(15):
    passwords = (itertools.product(Alphabet, repeat = CharLength))
    print("\n \n")
    # safprint("Bruteforcer is at ", (mcount / (time.time() - start)), "attempts per seconds")
    print("Checking ", CharLength, " character passwords")
    print(time.time() - start, " seconds! have passed - Not getting tired but have tried ", mcount, " combinations already!")
    for i in passwords:
        mcount += 1
        i = str(i)
        i = i.replace("[", "")
        i = i.replace("]", "")
        i = i.replace("'", "")
        i = i.replace(" ", "")
        i = i.replace(",", "")
        i = i.replace("(", "")
        i = i.replace(")", "")

        if i == string_password:
            end = time.time()
            exp_time = end - start
            print("Found it in ", exp_time, " seconds and ", mcount, "attempts")
            print("That is ", mcount / exp_time, " attempts per second!")
            print(Password)
            input("TIRED? Press ENTER to END")
            exit()

# References:
# Hax, P (nd) Instructable Circuits.https://www.instructables.com/Password-Brute-forcer-in-Python/