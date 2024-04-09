#!/bin/bash

##Arthur Sant'Anna de Carvalho Santos##

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_29mar2024/HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv"

NOVO_CSV="covid_salvador_ba_2023_2.csv"

awk -F';' 'NR==1 { print $2";" $3";" $8";" $12";" $14 }' "$ARQUIVO_CSV" > "$NOVO_CSV"

awk -F';' '{ if ($2=="BA" && $3=="Salvador") print $2";" $3";" $8";" $12";" $14 }' "$ARQUIVO_CSV" >> "$NOVO_CSV"

echo "Os dados para Salvador, BA, no segundo semestre de 2023 foram extraídos para o arquivo: $NOVO_CSV"

