#!/bin/bash

PS3='Seleccione una opción: '
options=("Añadir IP" "Borrar IP" "Borrar todas las IPs" "Listar IPs" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Añadir IP")
            clear;
            sh add-ip.sh;
            break
            ;;
        "Borrar IP")
            clear
            sh delete-ip.sh
            break
            ;;
        "Borrar todas las IPs")
            clear;
            sh delete-all-ips.sh
            break
            ;;
        "Listar IPs")
            clear;
            sh list-ips.sh
            break
            ;;
        "Salir")
            clear;
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
