#!/bin/bash

clear;

PS3='Seleccione una opción: '
options=("Administrar IPs" "Administrar servidores" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Administrar IPs")
            sh ip-administration.sh
            break;
            ;;
        "Administrar servidores")
            sh server-administration.sh
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
