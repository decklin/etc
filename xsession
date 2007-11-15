#!/bin/sh

toolwait() { while ! xlsclients | grep -q "$1"; do sleep 1; done; }
propwait() { while ! xprop -root "$1" | grep -q "$2"; do sleep 1; done; }

test -d ~/bin && PATH="~/bin:${PATH}"
test -e ~/.bash_env && . ~/.bash_env

test -e ~/.fehbg && . ~/.fehbg
xsetroot -cursor_name left_ptr

xset m 3 10
xset b 50 150 60
xrdb ~/.Xresources
xmodmap ~/.Xmodmap

xbindkeys
urxvtd -q -f -o
xscreensaver -no-splash &
rtail &

aewm 2>&1 &
propwait _NET_SUPPORTED _NET_NUMBER_OF_DESKTOPS
aedesk -n 4 0

xfce4-panel &
toolwait xfce4-panel
# setstrut ...

ssh-add &
exec aesession
