#!/bin/bash

##Arthur Sant'Anna de Carvalho Santos##

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_30mar2024/HIST_PAINEL_COVIDBR_2023_Parte2_30mar2024.csv"

awk -F';' 'BEGIN{novosObitos=0;}{if($2=="BA" && $3=="Salvador" && $8 >="2023-11-01" && $8<="2023-11-30"){ novosObitos+=$14 }}END{print "O numero de novos obitos no mes de novembro de 2023, em Salvador-BA foi: " novosObitos}' "$ARQUIVO_CSV"
