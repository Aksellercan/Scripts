#!/bin/bash
random_number=$(($RANDOM%(10-1+1)+1))
string="Good day"
if [[ $random_number == 1 ]]; then
	string="Hello World"
elif [[ $random_number == 2 ]]; then
	string="2 + 2 = 5"
elif [[ $random_number == 3 ]]; then
	string="Paranoid Android"
elif [[ $random_number == 4 ]]; then
	string="I use Arch btw"
elif [[ $random_number == 5 ]]; then
	string="cloudberry"
elif [[ $random_number == 6 ]]; then
	string="Not Happening"
fi
figlet $string
