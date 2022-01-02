#!/bin/bash

clear;
source ./colors.sh

PS3='Seleccione una opción: '
options=("Administrar IPs" "Administrar servidores" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Administrar IPs")
            clear
            sh ip-administration.sh
            break
            ;;
        "Administrar servidores")
            clear
            sh server-administration.sh
            break
            ;;
        "Salir")
            clear
            break
            ;;
        *) echo -e "${YELLOW}invalid option $REPLY${ENDCOLOR}";;

    esac
done
