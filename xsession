#!/bin/sh

source_existing() { for f; do test -e "$f" && . "$f"; done; }
propwait() { while ! xprop -root "$1" | grep -q "$2"; do sleep 1; done; }

source_existing ~/.profile ~/.xsetup.local

test -e ~/.Xresources && xrdb ~/.Xresources
test -e ~/.Xmodmap && xmodmap ~/.Xmodmap

xsetroot -cursor_name left_ptr
xset m 3 10
xset b 100 441 25

xbindkeys
aewm 2>&1 &
propwait _NET_SUPPORTED _NET_NUMBER_OF_DESKTOPS
aedesk -n 4 0

source_existing ~/.xsession.local

exec aesession
