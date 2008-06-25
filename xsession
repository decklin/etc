#!/bin/sh

toolwait() { while ! xlsclients | grep -q "$1"; do sleep 1; done; }
propwait() { while ! xprop -root "$1" | grep -q "$2"; do sleep 1; done; }

. $HOME/.profile

test -e $HOME/.fehbg && . $HOME/.fehbg
xsetroot -cursor_name left_ptr
xset m 3 10
xset b 50 150 60
xrdb $HOME/.Xresources
xmodmap $HOME/.Xmodmap

aewm 2>&1 &

xbindkeys
urxvtd -q -f -o
conky &
yeahconsole &

propwait _NET_SUPPORTED _NET_NUMBER_OF_DESKTOPS
aedesk -n 4 0

ssh-add &
cat <<EOF >$HOME/var/ssh/agent
export SSH_AGENT_PID=$SSH_AGENT_PID
export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
EOF

exec aesession
