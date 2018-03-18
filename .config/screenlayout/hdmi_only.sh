#!/bin/sh
xrandr --output HDMI-2 --primary --auto --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output eDP-1 --off --output DP-2 --off
pkill polybar
polybar hdmi
~/.fehbg
