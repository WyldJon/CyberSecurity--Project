#!/bin/bash

if [ $3 = 'BlackJack' ]
then
	FIRST_NAME=3
	LAST_NAME=4
elif [ $3 = 'Roulette' ]
then
	FIRST_NAME=5
	LAST_NAME=6
else
	FIRST_NAME=7
	LAST_NAME=8
fi


grep -i "$2" $1_Dealer_schedule | awk -F" " -v FIRST=$FIRST_NAME -v LAST=$LAST_NAME  '{print $FIRST, $LAST}'
