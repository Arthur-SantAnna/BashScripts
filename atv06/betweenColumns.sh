#!/bin/bash

##Arthur Sant'Anna de Carvalho Santos##

ARQUIVO_CSV="HIST_PAINEL_COVIDBR_2023_Parte2_13abr2024.csv"

awk -F';' 'BEGIN{ novosCasos=0; obitosAcumulados=0; novosObitos=0; recuperadosNovos=0; total=0;}{if($2=="BA" && $3=="Salvador" && $8 >="2023-11-01" && $8<="2023-11-30"){ novosCasos+=$12;obitosAcumulados+=$13;novosObitos+=$14;recuperadosNovos+=$15; total+=$12+$13+$14+$15 }}END{print "O numero de novos obitos no mes de novembro de 2023, em Salvador-BA foi: " novosObitos ". Novos casos: " novosCasos ". Obitos acumulados: " obitosAcumulados ". Recuperados novos: " recuperadosNovos ". Total: " total }' "$ARQUIVO_CSV"
