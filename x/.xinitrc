#!/bin/sh
#
# xinitrc

# settings
xsetroot -cursor_name left_ptr
xset s off -dpms -b
xset r rate 300 50
setxkbmap -option ctrl:nocaps &

# rice
xrdb -load ~/.Xresources
xset +fp $HOME/.local/share/fonts
xset fp rehash

# wallpaper
. ~/.fehbg &

numlockx on
compton -b
slstatus &
exec dwm
