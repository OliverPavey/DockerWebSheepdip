#!/bin/bash

if [ $DISPLAY == 'WINDOWS' ]; then
    HOST_IP=$(ipconfig |grep -A 6 "Ethernet adapter Ethernet" |grep "IPv4 Address" |awk '{ print $NF; }')
    DISPLAY=$HOST_IP:0.0
elif [ $DISPLAY == 'LINUX' ]; then
    HOST_IP=$(ifconfig |grep -A 6 "^eth0:" |grep "^\s*inet" |awk '{ print $2; }')
    DISPLAY=$HOST_IP:0.0
fi

launchcontainer() {
    echo "DISPLAY=$DISPLAY"
    echo "Launching $1"
    docker run -it --rm \
        --network host \
        --name sheepdip \
        -e DISPLAY=$DISPLAY \
        $1
}

case $1 in

"build")
docker build --tag sheepdip-x11      - < Dockerfile.x11
docker build --tag sheepdip-luakit   - < Dockerfile.luakit
docker build --tag sheepdip-firefox  - < Dockerfile.firefox
docker build --tag sheepdip-chromium - < Dockerfile.chromium
;;

"luakit")
launchcontainer sheepdip-luakit
;;

"firefox")
launchcontainer sheepdip-firefox
;;

"chromium")
launchcontainer sheepdip-chromium
;;

"stop")
docker stop sheepdip
;;

"logs")
docker logs --follow sheepdip
;;

"bash")
docker exec -it sheepdip bash
;;

*)
echo 'Usage instructions are in the README.md file.'
;;

esac