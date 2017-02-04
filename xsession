#!/bin/sh

test -e ~/.profile && . ~/.profile
test -e ~/.xsetup.local && . ~/.xsetup.local
test -e ~/.fehbg && . ~/.fehbg
test -e ~/.Xresources && xrdb ~/.Xresources
test -e ~/.Xmodmap && xmodmap ~/.Xmodmap

toolwait() { while ! xlsclients | grep -q "$1"; do sleep 1; done; }
propwait() { while ! xprop -root "$1" | grep -q "$2"; do sleep 1; done; }

xsetroot -cursor_name left_ptr
xset m 3 10
xset b 100 441 25

xbindkeys
aewm 2>&1 &
propwait _NET_SUPPORTED _NET_NUMBER_OF_DESKTOPS
aedesk -n 4 0

test -e ~/.xsession.local && . ~/.xsession.local

exec aesession
