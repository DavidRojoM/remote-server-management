#!/bin/bash

clear
source ./colors.sh
PS3='Seleccione una opción: '
options=("Generar nuevas llaves" "Estado de los servidores" "Espacio libre en servidores" "Desplegar imagen" "Atras")
select opt in "${options[@]}"
do
    case $opt in
        "Generar nuevas llaves")
            sh gen-new-keys.sh
            break
            ;;
        "Estado de los servidores")
            sh server-status.sh
            break
            ;;
        "Espacio libre en servidores")
            sh check-disk-free.sh
            break
            ;;
        "Desplegar imagen")
            echo "you chose choice 2"
            ;;
        "Atras")
        sh launcher.sh
            break
            ;;
        *) echo -e "${YELLOW}invalid option $REPLY${ENDCOLOR}";;
    esac
done
