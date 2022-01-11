#!/bin/bash

source ./colors.sh

if [[ -e ip-list.txt ]]; then
cat -n ip-list.txt
else echo -e "${YELLOW}No hay ninguna ip${ENDCOLOR}"
fi

read -rp "Pulse enter para continuar... "
clear;
bash ip-administration.sh
