for dir in /var/lib/gems/*/bin \
           $HOME/.gem/ruby/*/bin \
           $HOME/.cabal/bin \
           $HOME/.local/bin \
           $HOME/proj/harvard/anl-utils \
           $HOME/proj/decklin/bin \
           $HOME/bin
do
    test -d "$dir" && PATH="$dir:$PATH"
done

export EDITOR=emacswrapper
export FCEDIT=$EDITOR
export PAGER=less
export LESS=-iMQRX
export BROWSER=w3m

export TMPDIR=$HOME/tmp
export TERMINFO=$HOME/.terminfo
export GTK_DEFAULT_FILECHOOSER_DIR=$HOME/mess/cur
export PYTHONSTARTUP=$HOME/.python/startup.py
export RLWRAP_HOME=$HOME/.rlwrap
export RXVT_SOCKET=$HOME/.urxvt/socket

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

test "$BASH" && . $HOME/.bashrc
