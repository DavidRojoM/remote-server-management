#!/bin/bash

clear
PS3='Seleccione una opción: '
options=("Generar nuevas llaves" "Estado de los servidores" "Espacio libre en servidores" "Desplegar imagen" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Generar nuevas llaves")
            sh gen-new-keys.sh
            break
            ;;
        "Estado de los servidores")
            echo "you chose choice 2"
            ;;
        "Espacio libre en servidores")
            echo "you chose choice 2"
            ;;
        "Desplegar imagen")
            echo "you chose choice 2"
            ;;
        "Salir")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
