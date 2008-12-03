for dir in bin .cabal/bin proj/decklin/bin proj/harvard/anl-utils; do
    test -d $dir && PATH="$HOME/$dir:$PATH"
done

export ENV=$HOME/.shrc

export EDITOR=ec
export VISUAL=$EDITOR
export ALTERNATE_EDITOR=vi
export PAGER=more
export LESS=-acij2mqR
export BROWSER=w3m
export SSH_ASKPASS=ssh-askpass

export TMPDIR=$HOME/tmp
export GTK_DEFAULT_FILECHOOSER_DIR=$HOME/mess/cur
export PYTHONSTARTUP=$HOME/.python/startup.py
export RLWRAP_HOME=$HOME/.rlwrap
export RXVT_SOCKET=$HOME/.urxvt/socket

export MANWIDTH=78
export WHOIS_HIDE=1
export EMAIL=decklin@red-bean.com
export DEBEMAIL=$EMAIL
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
