#!/bin/sh
#
# xinitrc

# start daemons
# udiskie -aT &
urxvtd -q -o -f
compton -b &
dunst &

# settings
xsetroot -cursor_name left_ptr
xset s off -dpms -b
xset r rate 300 50
setxkbmap -option ctrl:nocaps &

# rice
xrdb -load ~/.Xresources
xset +fp $HOME/.local/share/fonts
xset fp rehash

# set background
hsetroot -solid $(get_xres color2)
# source ~/.fehbg &

# etc
polybar -r base &

# system
# thunar --daemon &
# xfce4-power-manager &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# unclutter -idle 2 &
# numlockx on

session=${1:-2bwm}

case $session in
    2bwm|twobwm     ) sxhkd -m 1 & \
                        exec 2bwm;;
    dwm             ) sxhkd -m 1 & \
                        slstatus & \
                        exec dwm;;
    bspwm|bsp       ) sxhkd -m 1 -c ~/.config/sxhkd/bspsxhkdrc & \
                        exec bspwm;;
    # No known session, try to run it as command
    *               ) exec $1;;
esac
