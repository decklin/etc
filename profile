for dir in $HOME/bin $HOME/proj/decklin/bin $HOME/proj/harvard/anl-utils \
           $HOME/.local/bin $HOME/.cabal/bin /var/lib/gems/*/bin; do
    test -d $dir && PATH="$dir:$PATH"
done

test "$BASH_VERSION" && set -o posix

export ENV=$HOME/.shrc

export EDITOR=e
export FCEDIT=$EDITOR
export PAGER=less
export LESS=-FiMQRX
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
