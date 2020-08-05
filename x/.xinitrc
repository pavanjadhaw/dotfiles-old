#!/bin/sh
#
# xinitrc

# settings
xsetroot -cursor_name left_ptr
xset s off -dpms -b
xset r rate 300 50
setxkbmap -option ctrl:nocaps &

xrdb -load ~/.Xresources
xset +fp /home/pavan/.local/share/fonts
xset fp rehash

urxvtd -q &
compton -b
slstatus &

hsetroot -cover ~/.wall.png &

~/bin/startdwm
