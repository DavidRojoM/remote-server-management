#!/bin/bash

source ./colors.sh

cat /dev/null > ip-list.txt

list_length=$(cat ip-list.txt | wc -l)
if [ "$list_length" -eq 0 ]; then
    echo -e "\n${GREEN}Eliminadas correctamente${ENDCOLOR}\n"
    else echo -e "\n${RED}No se ha podido eliminar${ENDCOLOR}\n"
fi
read -rp "Pulse enter para continuar... "
clear
bash ip-administration.sh
