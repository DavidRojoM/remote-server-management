#!/bin/bash

read -rp "Introduzca una IP : " ip
echo "$ip">>ip-list.txt
sh ip-administration.sh
