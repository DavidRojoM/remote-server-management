#!/bin/bash

clear;
PS3='Seleccione una opción: '
options=("Generar nuevas llaves" "Estado de los servidores" "Espacio libre en servidores" "Desplegar imagen" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Administrar IPs")
            sh check-disk-free.sh
            break;
            ;;
        "Administrar servidores")
            echo "you chose choice 2"
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
