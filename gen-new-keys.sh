#!/bin/bash

if ! [[ -e ip-list.txt ]] || ! [ "$(cat ip-list.txt | wc -l)" -gt 0 ]; then
  clear
  echo 'No has insertado ninguna ip'
  sleep 1
  clear
  sh server-administration.sh
fi

if [[ -e server-administration-key ]] && [[ -e server-administration-key.pub ]]; then
  install -m 700 /dev/null server-administration-key.backup
  install -m 700 /dev/null server-administration-key.backup.pub
  cat server-administration-key >server-administration-key.backup
  cat server-administration-key.pub >server-administration-key.backup.pub
  mv server-administration-key /dev/null 2>/dev/null
fi

mkdir logs 2>/dev/null
touch logs/error.log 2>/dev/null
ssh-keygen -C server-administration-key -N '' -f server-administration-key <<<y 1>/dev/null 2>>logs/error.log

source ./check-server-status.sh

while read -r line; do
  user=$(echo "$line" | cut -f1)
  ip=$(echo "$line" | cut -f2)
    echo "Actualizando $ip..."
  if is_server_online "$ip"; then
    scp -o StrictHostKeyChecking=no -i server-administration-key.backup server-administration-key.pub "$user"@"$ip":~/.ssh/server-administration-key.pub 1>/dev/null 2>/dev/null
    ssh -o StrictHostKeyChecking=no -i server-administration-key.backup -n "$user"@"$ip" "touch ~/.ssh/authorized_keys;grep -v 'server-administration-key' ~/.ssh/authorized_keys>~/.ssh/authorized_keys.tmp;cat ~/.ssh/server-administration-key.pub>>~/.ssh/authorized_keys.tmp;mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys;rm -f ~/.ssh/server-administration-key.pub" 2>/dev/null
    new_key=$(cat server-administration-key.pub)

    successful_update=$(ssh -o StrictHostKeyChecking=no -i server-administration-key -n "$user"@"$ip" "cat ~/.ssh/authorized_keys | grep -i '$new_key' | wc -l" 2>/dev/null)

    if [ "$successful_update" -eq 1 ]; then
      echo 'Actualizado correctamente'
    else
      echo 'Error al actualizar la clave'
    fi
  else
    echo "El server con la ip $ip se encuentra offline"
    echo "Server ip: $ip offline">logs/error.log
    sleep 2
  fi

done <./ip-list.txt

clear
echo -e "La nueva key es \n\n$(cat server-administration-key)\n"
read -rp "Presione enter para continuar"
sh server-administration.sh
