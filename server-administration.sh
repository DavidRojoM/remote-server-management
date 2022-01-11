#!/bin/bash

clear
source ./colors.sh
PS3='Seleccione una opción: '
options=("Generar nuevas llaves" "Estado de los servidores" "Espacio libre en servidores" "Desplegar imagen" "Atras")
select opt in "${options[@]}"
do
    case $opt in
        "Generar nuevas llaves")
            bash gen-new-keys.sh
            break
            ;;
        "Estado de los servidores")
            bash server-status.sh
            break
            ;;
        "Espacio libre en servidores")
            bash check-disk-free.sh
            break
            ;;
        "Desplegar imagen")
            bash docker-administration.sh
            break
            ;;
        "Atras")
            bash launcher.sh
            break
            ;;
        *) echo -e "${YELLOW}invalid option $REPLY${ENDCOLOR}";;
    esac
done
