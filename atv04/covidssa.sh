#!/bin/bash

##Arthur Sant'Anna de Carvalho Santos##

awk -F';' '{ print $3 }' /home/arthur/Downloads/HIST_PAINEL_COVIDBR_29mar2024/HIST_PAINEL_COVIDBR_2023_Parte2_29mar2024.csv
