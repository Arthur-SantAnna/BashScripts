#!/bin/bash

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_2023_Parte2_13abr2024.csv"

awk -F';' '$2=="BA" && $3!="" {municipio=$3; cidade = municipio; obitosAcumulados=$13; obitosNovos=$14; data=$8; gsub(" ", "", cidade); if(!seen[municipio]){print "municipio;obitosAcumulados;obitosNovos;data" > cidade".csv"; seen[municipio] = 1;} print municipio";" obitosAcumulados";" obitosNovos";" data >> cidade".csv"}' "$ARQUIVO_CSV"
