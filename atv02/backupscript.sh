#!/bin/bash

##Arthur Sant'Anna de Carvalho Santos##

date=$(date +"%d-%m-%Y-%H:%M:%S")

function backup {
	if [ -d "Backup" ]
	then
		rm -r -v Backup
	fi
	
	mkdir -v Backup
	
	for arq in *
	do
		if [ "$arq" != "Backup" ]
		then
		cp -r -v ${arq} "Backup/${arq%.*}_${date}.${arq#*.}"
		fi
	done
}

function temp1 {
	if [ -d "Tmp" ]
	then
		rm -r -v Tmp
	fi
	
	mkdir -v Tmp
	
	for arq in *
	do
		if [ "$arq" != "Tmp" ] && [[ "$arq" = [a,e,i,o,u,A,E,I,O,U]* ]]
		then
		cp -r -v ${arq} "Tmp/${arq%.*}_${date}.${arq#*.}"
		fi
	done
}

function temp2 {
	if [ -d "Tmp" ]
	then
		rm -r -v Tmp
	fi
	
	mkdir -v Tmp
	
	for arq in *
	do
		if [ "$arq" != "Tmp" ] && [[ "$arq" != [a,e,i,o,u,A,E,I,O,U]* ]]
		then
		cp -r -v ${arq} "Tmp/${arq%.*}_${date}.${arq#*.}"
		fi
	done
}


function remove {
	rm -r -f -v Backup
	rm -r -f -v Tmp
}

echo "Insira um comando para executar"
read input

input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

case $input in
"backup")
	backup;;
"temporario1")
	temp1;;
"temporario2")
	temp2;;
*)
	remove;;
esac
