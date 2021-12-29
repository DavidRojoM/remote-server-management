#!/bin/bash

if [[ -e ip-list.txt ]]; then
cat -n ip-list.txt
else echo 'No hay ninguna ip'
fi

read -rp "Pulse una tecla para continuar : " continue
clear;
sh ip-administration.sh
