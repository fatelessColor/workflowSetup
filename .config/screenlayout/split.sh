#!/bin/sh
xrandr --output HDMI-2 --auto --pos 1920x0 --rotate normal  --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
pkill polybar
polybar main
polybar hdmi
~/.fehbg
