#!/bin/bash

if [ -d "$1" ]
then
	result="rc=1"
elif [ -x "$1" ]
then
	result="rc=2"
else
	result="rc=0"
fi

echo $result
