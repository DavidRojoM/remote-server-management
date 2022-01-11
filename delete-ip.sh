#!/bin/bash

source ./colors.sh

if ! [[ -e ip-list.txt ]]; then
    echo -e "\n${YELLOW}Debes insertar alguna ip${ENDCOLOR}\n"
    read -rp "Presione enter para continuar..."
  bash ip-administration.sh
fi

ipListLength="$(cat ip-list.txt | wc -l)"
cat -n ip-list.txt
echo '0. Salir'

read -rp "Seleccione una opción : " option

if [ "$option" -eq 0 ]; then
    clear
    bash ip-administration.sh
fi


if ! [ "$option" -le "$ipListLength" ] || ! [ "$option" -ge 1 ]; then
        clear
        echo -e "\n${YELLOW}Debes seleccionar una ip de la lista${ENDCOLOR}\n"
        sleep 1
        clear
        bash delete-ip.sh
fi

before=$(cat ip-list.txt | wc -l)
sed "${option}d" ip-list.txt>tmp.txt
cat tmp.txt> ip-list.txt
rm -f tmp.txt
after=$(cat ip-list.txt | wc -l)

if [ "$before" -gt "$after" ]; then
    echo -e "\n${GREEN}Eliminado correctamente${ENDCOLOR}\n"
    else echo -e "\n${RED}No se ha podido eliminar${ENDCOLOR}\n"
fi
read -rp "Presione enter para continuar..."
clear
bash ip-administration.sh
