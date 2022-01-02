#!/bin/bash

is_docker_installed() {
user=$1
ip=$2

 isInstalled=$(ssh -o StrictHostKeyChecking=no -i server-administration-key -n "$user@$ip" "which docker | grep -c '/docker'")
if [ "$isInstalled" == 0 ];then
return 0
else return 1
fi
}
