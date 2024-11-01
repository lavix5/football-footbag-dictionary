#!/bin/bash

E_NOARGS=85
E_BADARGS=86
trick="$1"

if [ -z "$1" ]
then
        echo "Usage: $0 trick_name"
        exit $E_NOARGS
fi

if [ $# -gt 1 ]
then
        echo "Usage: $0 trick_name"
        exit $E_BADARGS
fi

line_number_footbag=$(grep -in "$trick" footbag | cut -d : -f 1)
line_number_football=$(grep -in "$trick" football | cut -d : -f 1)

if [[ "$line_number_footbag" == "" && "$line_number_football" == "" ]]
then
	echo "Trick name $trick not found in dictionary"
	exit 0
fi

if [[ "$line_number_footbag" != "" ]]
then
	echo "Footbag trick $trick is football trick $( head -n "$line_number_footbag" football | tail -1 ) "
fi

if [[ "$line_number_football" != "" ]]
then
	echo "Football trick $trick is footbag trick $( head -n "$line_number_football" footbag | tail -1 ) "
fi

