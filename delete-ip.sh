#!/bin/bash

if ! [[ -e ip-list.txt ]]; then
  echo 'No hay ninguna ip'
  sleep 1
  sh ip-administration.sh
fi

ipListLength="$(cat ip-list.txt | wc -l)"
cat -n ip-list.txt
echo '0. Salir'

read -rp "Seleccione una opción : " option

if [ "$option" -eq 0 ]; then
    clear
    sh ip-administration.sh
fi


if ! [ "$option" -le "$ipListLength" ] && [ "$option" -ge 1 ]; then
        clear
        echo 'Debes seleccionar una ip de la lista'
        sleep 1
        clear
        sh delete-ip.sh
fi



sed "${option}d" ip-list.txt>tmp.txt
cat tmp.txt> ip-list.txt
rm -f tmp.txt
clear
sh ip-administration.sh

#TODO: Mensajes de éxito o error
