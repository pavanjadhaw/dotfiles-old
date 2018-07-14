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
source ~/.fehbg &

unclutter -b
redshift &

# system
# udiskie -aT &
# thunar --daemon &
# xfce4-power-manager &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# unclutter -idle 2 &
# numlockx on




wm() {
    # urxvt daemon
    urxvtd -q -o -f
    # notification daemon
    dunst &
	# Window compositor
	compton -b

	wm=$1

    if [ $wm == bspwm ]
    then
        sxhkd -c $HOME/.config/sxhkd/sxhkdrc_${wm} $HOME/.config/sxhkd/commons &
    else
        sxhkd -c $HOME/.config/sxhkd/commons &
    fi

    if [ $wm == dwm ]
    then
        slstatus &
    else
        polybar base &
    fi

	exec $wm
}

wm 2bwm
