for bin in $HOME/bin $HOME/proj/decklin/bin $HOME/proj/harvard/anl-utils; do
    test -d $bin && PATH="$bin:$PATH"
done

export ENV=$HOME/.shrc

export EDITOR=vi
export VISUAL=$EDITOR
export PAGER=more
export LESS=-acij2mqR
export BROWSER=iceweasel:w3m
export TMPDIR=$HOME/tmp
export GTK_DEFAULT_FILECHOOSER_DIR=$HOME/mess/cur
export MANWIDTH=78
export PYTHONSTARTUP=$HOME/.python/startup.py
export RLWRAP_HOME=$HOME/.rlwrap
export RXVT_SOCKET=$HOME/.urxvt/socket
export SSH_ASKPASS=ssh-askpass
export WHOIS_HIDE=1
export DEBFULLNAME='Decklin Foster'
export EMAIL=decklin@red-bean.com

export LANG=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=C
export LESSCHARSET=utf-8
export MANFMT=utf8
