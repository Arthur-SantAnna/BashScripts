#!/bin/bash

## Arthur Sant'Anna de Carvalho Santos##

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_2023_Parte2_13abr2024.csv"

NOVO_CSV="covid_ba_2023_2.csv"

awk -F';' '$2=="BA" && $3!="" {municipio=$3; cidade = municipio; obitosAcumulados=$13; obitosNovos=$14; data=$8; gsub(" ", "", cidade); if(!seen[municipio]){print "municipio;obitosAcumulados;obitosNovos;data" > cidade".csv"; seen[municipio] = 1;} print municipio";" obitosAcumulados";" obitosNovos";" data >> cidade".csv"}' "$ARQUIVO_CSV"

awk -F';' 'NR==1 { print $3";" $13";" "maxNovosObitos;" $8 }' "$ARQUIVO_CSV" > "$NOVO_CSV"

for arq in *.csv
do
	if [ "$arq" != "$NOVO_CSV" ] && [ "$arq" != "$ARQUIVO_CSV" ]
	then
	awk -F';' 'NR==2 { municipio=$1; obitosAcumulados=$2; novosObitos=$3; data=$4; } NR>2 { if($3 >= novosObitos){ obitosAcumulados=$2; novosObitos=$3; data=$4 }}END{ print municipio";" obitosAcumulados";" novosObitos";" data }' "$arq" >> "$NOVO_CSV"
	fi
done
