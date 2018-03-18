# How to use:
#
# Just place a lock.png in your home folder to overlay whatever you want 
RANDOM=`date '+%s'`
var1="$(( 1 + RANDOM % 2))"

#!/bin/bash
scrot -z ~/.config/i3lock/lockbg.png 

if [ $var1 = "1" ]; then
    #blur
    convert ~/.config/i3lock/lockbg.png -blur 0x15 $f ~/.config/i3lock/lockbg.png
fi

if [ $var1 = "2" ]; then
    #pixelate
    convert ~/.config/i3lock/lockbg.png -scale 5% -scale 2000% ~/.config/i3lock/lockbg.png 
fi

convert -gravity center -composite ~/.config/i3lock/lockbg.png ~/.config/i3lock/lock.png ~/.config/i3lock/lockfinal.png


xdotool mousemove 5 5
xdotool mousemove 1999 1999
i3lock -u -i ~/.config/i3lock/lockfinal.png
rm ~/.config/i3lock/lockfinal.png ~/.config/i3lock/lockbg.png 
