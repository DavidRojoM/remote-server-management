#!/bin/bash

if ! [[ -e ip-list.txt ]] || ! [ "$(cat ip-list.txt | wc -l)" -gt 0 ]; then
  clear
  echo 'No has insertado ninguna ip'
  sleep 1
  clear
  sh server-administration.sh
fi

if [[ -e server-administration-key ]] && [[ -e server-administration-key.pub ]]; then
  rm -f server-administration-key server-administration-key.pub
fi
ssh-keygen -C server-administration-key -N '' -f server-administration-key <<< y 1>/dev/null 2>>logs/error.log
clear
echo -e "La nueva key es \n\n$(cat server-administration-key)\n"
read -rp "Presione enter para continuar" continue
clear
sh server-administration.sh
