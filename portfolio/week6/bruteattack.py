#!/usr/bin/python3 
# bruteattack.py - python script for dbruteforce attack using combinations of letters in the alphabet and numbers
# Author Bimbo Bakare
# Date 22Feb2022

# Libraries to aid in the atack
from pkg_resources import WorkingSet
import itertools
import time
import hashlib

# Specifying the characters to use for the bruteforce attack, as opposed to a dictionary
Alphabet = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.!")
Password = input("What is your password?\n")
# str = hashlib.sha256(mPassword.encode('utf-8'))
# Password = str.hexdigest()

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

        # str = hashlib.sha256(i.encode('utf-8'))
        # ivv = str.hexdigest()

        if i == Password:
            end = time.time()
            exp_time = end - start
            print("Found it in ", exp_time, " seconds and ", mcount, "attempts")

            print("That is ", mcount / exp_time, " attempts per second!")
            print(Password)
            input("TIRED? Press ENTER to END")
            exit()

# References:
# Hax, P (nd) Instructable Circuits.https://www.instructables.com/Password-Brute-forcer-in-Python/