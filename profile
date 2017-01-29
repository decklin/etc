_add_path() {
    for dir; do
        test -d "$dir" -a "${PATH##*$dir:}" = "$PATH" && PATH="$dir:$PATH"
    done
}

_add_path /usr/local/share/npm/bin
_add_path /var/lib/gems/*/bin
_add_path $HOME/.gem/ruby/*/bin
_add_path $HOME/Library/Haskell/bin
_add_path $HOME/.cabal/bin
_add_path $HOME/.lein/bin
_add_path $HOME/proj/harvard/anl-utils
_add_path $HOME/proj/decklin/bin
_add_path $HOME/.local/bin
_add_path $HOME/bin

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

test -d "$TMPDIR" || mkdir -p "$TMPDIR"

test "$BASH" && . $HOME/.bashrc
