#!/bin/sh

test -e $HOME/.profile && . $HOME/.profile
test -e $HOME/.xsetup.local && . $HOME/.xsetup.local
test -e $HOME/.fehbg && . $HOME/.fehbg
test -e $HOME/.Xresources && xrdb $HOME/.Xresources
test -e $HOME/.Xmodmap && xmodmap $HOME/.Xmodmap

toolwait() { while ! xlsclients | grep -q "$1"; do sleep 1; done; }
propwait() { while ! xprop -root "$1" | grep -q "$2"; do sleep 1; done; }

xsetroot -cursor_name left_ptr
xset m 3 10
xset b 100 441 25

xbindkeys
aewm 2>&1 &
propwait _NET_SUPPORTED _NET_NUMBER_OF_DESKTOPS
aedesk -n 4 0

test -e $HOME/.xsession.local && . $HOME/.xsession.local

exec aesession
