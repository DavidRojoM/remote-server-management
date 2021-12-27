#!/bin/bash

PS3='Please enter your choice: '
options=("Administrar IPs" "Administrar servidores" "Salir")
select opt in "${options[@]}"
do
    case $opt in
        "Administrar IPs")
            sh check-disk-free.sh
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
