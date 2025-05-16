#!/usr/bin/env bash

OPTIONS=$(cat <<EOF
shutdown
reboot
logout
lock
EOF
)

CHOICE="$(printf "$OPTIONS" | fuzzel -d -l 4)"


confirm () {
    echo "$(printf "yes\nno" | fuzzel -d -l 2 -p "$1> ")"
}

case $CHOICE in
    "shutdown")
        if [[ "$(confirm "shutdown")" == "yes" ]] then
            poweroff
        fi;;
    "reboot")
        if [[ "$(confirm "reboot")" == "yes" ]] then
            reboot
        fi;;
    "logout")
        if [[ "$(confirm "logout")" == "yes" ]] then
            hyprctl dispatch exit
        fi;;
    "lock")
       sleep 0.1 && hyprlock;;    
esac
