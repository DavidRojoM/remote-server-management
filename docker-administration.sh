#!/bin/bash

source ./colors.sh

if ! [ -e ip-list.txt ] || [ "$(cat ip-list.txt | wc -l)" -eq 0 ]; then
    echo -e "\n${YELLOW}Debes insertar alguna ip${ENDCOLOR}\n"
    read -rp "Presione enter para continuar..."
    bash server-administration.sh
fi

ipListLength="$(cat ip-list.txt | wc -l)"
cat -n ip-list.txt
echo '0. Salir'

read -rp "Seleccione una ip : " option

if [ "$option" -eq 0 ]; then
    clear
    bash server-administration.sh
fi


if ! [ "$option" -le "$ipListLength" ] || ! [ "$option" -ge 1 ]; then
        clear
        echo -e "\n${YELLOW}Debes seleccionar una ip de la lista${ENDCOLOR}\n"
        sleep 1
        clear
        bash docker-administration.sh
fi

source ./check-docker-installed.sh

user=$(cut ip-list.txt -f1 | sed "$option!d")
ip=$(cut ip-list.txt -f2 | sed "$option!d")

source ./check-server-status.sh

if ! is_server_online "$ip"; then
     echo -e "${RED}\nEl servidor esta Offline${ENDCOLOR}\n"
     read -rp "Presione enter para continuar..."
     clear
     bash docker-administration.sh
fi

if ! is_docker_installed "$user" "$ip"; then
 echo -e "${RED}\nDocker no está instalado en el servidor${ENDCOLOR}\n"
while [ "$wants_to_install" != "yes" ] && [ "$wants_to_install" != "no" ]; do
 read -rp "Desea instalar Docker?(yes/no)" wants_to_install
done

if [ "$wants_to_install" == "yes" ]; then
    ssh -o StrictHostKeyChecking=no -i server-administration-key -t "$user@$ip" "curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && sudo usermod -aG docker $user && rm -f get-docker.sh" # && su - $user
    else  bash server-administration.sh
fi
fi


echo -e "${GREEN}Docker instalado en servidor${ENDCOLOR}"
read -rp "Introduzca una imagen de Docker Hub: " image
read -rp "En que puerto interno se ejecuta la imagen?: " inner_port
read -rp "En que puerto externo se ejecuta la imagen?: " outter_port
#TODO: BINDEAR VOLUMENES DEL SERVIDOR A LA IMAGEN
ssh -o StrictHostKeyChecking=no -i server-administration-key -n "$user@$ip" "docker run -d -p $outter_port:$inner_port $image "
echo
read -rp "Pulse enter para continuar..."
bash server-administration.sh
