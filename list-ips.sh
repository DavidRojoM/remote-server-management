#!/bin/bash

cat -n ip-list.txt

read -rp "Pulse una tecla para continuar : " continue

sh ip-administration.sh
