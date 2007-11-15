test -z "$PS1" && return
shopt -s checkwinsize

debian_chroot=$(cat /etc/debian_chroot 2>/dev/null)
PS1='\h${debian_chroot:+($debian_chroot)}:\W:$?\$ '
PS2='# '

case "$TERM" in
    rxvt*|xterm*|screen*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/#$HOME/~}\007"'
        ;;
esac

if [ "$TERM" != "dumb" -a -x /usr/bin/dircolors ]; then
    if [ -e ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
fi
if [ -x /usr/bin/lesspipe ]; then
    eval "$(lesspipe)"
fi

test -e ~/.bash_aliases && . ~/.bash_aliases
