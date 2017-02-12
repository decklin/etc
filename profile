export EDITOR=emacsac
export FCEDIT=$EDITOR
export PAGER=less
export LESS=-iMQRX
export BROWSER=w3m

export TMPDIR=~/tmp
export TERMINFO=~/.terminfo
export GTK_DEFAULT_FILECHOOSER_DIR=~/mess
export PYTHONSTARTUP=~/.python/startup.py
export RLWRAP_HOME=~/.rlwrap
export RXVT_SOCKET=~/.urxvt/socket

export COPYFILE_DISABLE=true
export HOMEBREW_TEMP=/tmp

export MANWIDTH=78
export WHOIS_HIDE=1
export EMAIL=decklin@red-bean.org
export DEBEMAIL=decklin@red-bean.com
export DEBFULLNAME='Decklin Foster'

export LANG=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=C
export LESSCHARSET=utf-8
export MANFMT=utf8

test -e ~/.profile.local && . ~/.profile.local
