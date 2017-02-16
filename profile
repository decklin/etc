export EDITOR=emacsac
export FCEDIT=$EDITOR
export PAGER=less
export LESS=-iMQRX
export BROWSER=w3m

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

# For all value that needs tilde expansion, we cannot use a single
# set-and-export command due to a bug in dash (really).

TMPDIR=~/tmp; export TMPDIR
TERMINFO=~/.terminfo; export TERMINFO
GTK_DEFAULT_FILECHOOSER_DIR=~/mess; export GTK_DEFAULT_FILECHOOSER_DIR
PYTHONSTARTUP=~/.python/startup.py; export PYTHONSTARTUP
RLWRAP_HOME=~/.rlwrap; export RLWRAP_HOME
RXVT_SOCKET=~/.urxvt/socket; export RXVT_SOCKET

. ~/.shrc.addpath

_addpath /usr/local/sbin
_addpath /usr/local/bin
_addpath /var/lib/gems/*/bin
_addpath ~/.gem/ruby/*/bin
_addpath ~/Library/Haskell/bin
_addpath ~/.cabal/bin
_addpath ~/.lein/bin
_addpath ~/proj/harvard/anl-utils
_addpath ~/proj/decklin/bin
_addpath ~/.local/bin
_addpath ~/bin

test "_$(uname)" = _Darwin && . ~/.profile.mac
test -e ~/.profile.local && . ~/.profile.local
