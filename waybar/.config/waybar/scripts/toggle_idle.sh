#!/usr/bin/env bash

pkill hypridle || hyprctl dispatch exec hypridle
kill -SIGRTMIN+10 $(pgrep waybar)

