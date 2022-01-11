#!/bin/bash

source ./colors.sh

PS3='Seleccione una opción: '
options=("Añadir IP" "Borrar IP" "Borrar todas las IPs" "Listar IPs" "Atras")
select opt in "${options[@]}"
do
    case $opt in
        "Añadir IP")
            clear;
            bash add-ip.sh;
            break
            ;;
        "Borrar IP")
            clear
            bash delete-ip.sh
            break
            ;;
        "Borrar todas las IPs")
            clear;
            bash delete-all-ips.sh
            break
            ;;
        "Listar IPs")
            clear;
            bash list-ips.sh
            break
            ;;
        "Atras")
            bash launcher.sh
            break
            ;;
        *) echo -e "${YELLOW}invalid option $REPLY${ENDCOLOR}";;
    esac
done

#192.168.0.1
#192.168.0.2
#192.168.0.3
#192.168.0.4
#192.168.0.5
#192.168.0.6
#192.168.0.7
#192.168.0.8
#192.168.0.9
