#!/bin/bash

is_server_online() {
ip=$1

 online=$(ping -c 1 "$ip" | grep -c "100% packet loss")
if [ "$online" == 0 ];then
return 0
else return 1
fi
}
