#!/bin/bash

clear
source ./colors.sh

if ! [ -e ip-list.txt ] || [ "$(cat ip-list.txt | wc -l)" -eq 0 ]; then
    echo -e "\n${YELLOW}Debes insertar alguna ip${ENDCOLOR}\n"
    read -rp "Presione enter para continuar..."
    bash server-administration.sh
fi

source ./check-server-status.sh
      echo -e "IP\t\t\tDisco"
while read -r line; do
      user=$(echo "$line" | cut -f1)
      ip=$(echo "$line" | cut -f2)
  if is_server_online "$ip"; then
      storage=$(ssh -o StrictHostKeyChecking=no -i server-administration-key -n "$user"@"$ip" "df -H | grep '% /$'")
      echo -e "${GREEN}$ip${ENDCOLOR}\t->\t${YELLOW}$storage${ENDCOLOR}"
      else echo -e "${GREEN}$ip${ENDCOLOR}\t->\t${RED}Offline${ENDCOLOR}"

  fi
done < ip-list.txt
echo
read -rp "Presione enter para continuar..."
bash server-administration.sh


