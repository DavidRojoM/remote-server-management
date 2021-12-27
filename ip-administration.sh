#!/bin/bash

clear
PS3='Seleccione una opción: '
options=("Añadir IP" "Borrar IP" "Borrar todas las IPs" "Listar IPs" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Añadir IP")
            sh add-ip.sh
            break
            ;;
        "Borrar IP")
            sh delete-ip.sh
            break
            ;;
        "Borrar todas las IPs")
            sh delete-all-ips.sh
            break
            ;;
        "Listar IPs")
            sh list-ips.sh
            break
            ;;
        "Salir")
            sh launcher.sh
            break
            ;;
        *) echo "invalid option $REPLY";;
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
