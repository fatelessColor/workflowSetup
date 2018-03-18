#!/bin/bash

var1=${1:-/dev/stdin}
var2=$(<~/.config/screenlayout/currentwallpaper)

if [ "$var1" = "0" ]; then
    if [ "$var2" = "anime" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/anime/*
    fi
    if [ "$var2" = "gaming" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/gaming/*
    fi
    if [ "$var2" = "detailed" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/detailed/*
    fi
    if [ "$var2" = "logo" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/logo/*
    fi
    if [ "$var2" = "i3" ]; then
        feh --bg-fill ~/Pictures/wallpaper/i3wallpaper.jpg
    fi
    if [ "$var2" = "debian" ]; then
        feh --bg-fill ~/Pictures/wallpaper/debian.png
    fi



    if [ "$var2" = "dark" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/dark.png
    fi
    if [ "$var2" = "light" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/light.png
    fi
    if [ "$var2" = "red" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/red.png
    fi
    if [ "$var2" = "blue" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/blue.png
    fi
    if [ "$var2" = "pink" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/pink.png
    fi
    if [ "$var2" = "green" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/green.png
    fi
    if [ "$var2" = "brown" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/brown.png
    fi
    if [ "$var2" = "purple" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/purple.png
    fi
    if [ "$var2" = "orange" ]; then
        feh --bg-fill ~/Pictures/wallpaper/color/orange.png
    fi
    if [ "$var2" = "random" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/color/*
    fi
    
    if [ "$var2" = "supersecret" ]; then
        feh --randomize --bg-fill ~/Pictures/wallpaper/.cancer/*
    fi

    exit 0
fi

cat > ~/.config/screenlayout/currentwallpaper << EOF
$var1
EOF

~/.config/screenlayout/wallpaper.sh 0
