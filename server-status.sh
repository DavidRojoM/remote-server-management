#!/bin/bash

source ./colors.sh
clear
if ! [ -e ip-list.txt ] || [ "$(cat ip-list.txt | wc -l)" -eq 0 ]; then
    echo -e "\n${YELLOW}Debes insertar alguna ip${ENDCOLOR}\n"
    read -rp "Presione enter para continuar..."
    sh server-administration.sh
fi

source ./check-server-status.sh
while read -r line; do
    ip=$(echo "$line" | cut -f2)
  if is_server_online "$ip"; then
      echo -e "${GREEN}$ip\t->\tOnline${ENDCOLOR}"
      else echo -e "${RED}$ip\t->\tOffline${ENDCOLOR}"
  fi
done < ip-list.txt
echo
read -rp "Presione enter para continuar..."
sh server-administration.sh
