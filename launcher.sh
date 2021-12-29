#!/bin/bash

clear;

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
            ;;
        "Salir")
            clear
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
