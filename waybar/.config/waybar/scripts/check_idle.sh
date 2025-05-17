#!/usr/bin/env bash

pid=$(pgrep hypridle)
kill -SIGRTMIN+10 $(pgrep waybar)
if [[ "$pid" == "" ]] then
    color="#ff004c"
else
    color="#7d12ff"
fi

echo "<span font='18' foreground='$color'></span>"
