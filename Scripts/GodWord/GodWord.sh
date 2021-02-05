#!/bin/bash

#This prints random words from the 1000 most common english words.

echo "$(shuf -n 32 /home/rwt/Scripts/GodWord/Words1000.TXT --random-source=/dev/urandom | tr '\n' ' ')"
