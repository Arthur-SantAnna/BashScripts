#!/bin/bash

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_2023_Parte2_13abr2024.csv"

awk -F';' '$2=="BA" && $3!="" {municipio=$3; obitosAcumulados=$13; data=$8;}{print municipio; print obitosAcumulados; print data}' "$ARQUIVO_CSV"
