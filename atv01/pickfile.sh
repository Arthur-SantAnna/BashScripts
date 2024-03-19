#!/bin/bash

echo "Insira o nome de um arquivo"
read filename

result=""
path=""

if [ -e "$filename" ]
then
	path="$(realpath "$filename")"
	result="$(./verifyfile.sh "$path")"
	
	case $result in
	"rc=0")
		echo "O arquivo eh do tipo padrao";;
	"rc=1")
		echo "O arquivo eh do tipo diretorio";;
	"rc=2")
		echo "O arquivo eh do tipo executavel";;
	*)
		echo "erro na execucao";;
	esac
else
	echo "arquivo nao encontrado"
fi		
