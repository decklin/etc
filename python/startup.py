from __future__ import print_function

import sys
import os
import atexit
import readline
import rlcompleter

sys.ps1 = '>>> '
sys.ps2 = '    '

inputrc = os.path.expanduser('~/.python/inputrc')
history = os.path.expanduser('~/.python/history')

def writehist():
    import readline
    readline.write_history_file(history)

try:
    readline.read_init_file(inputrc)
    readline.read_history_file(history)
    atexit.register(writehist)
except IOError:
    print('cannot initialize readline, skipping', file=sys.stderr)
    pass

del sys, os, atexit, readline, rlcompleter
