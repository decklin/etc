import sys
import os
import atexit
import readline
import rlcompleter

sys.ps1 = '>>> '
sys.ps2 = '    '

inputrc = os.path.expanduser('~/.python/inputrc')
history = os.path.expanduser('~/.python/history')

readline.read_init_file(inputrc)
readline.read_history_file(history)

def writehist():
    import readline
    readline.write_history_file(history)

atexit.register(writehist)

del sys, os, atexit, readline, rlcompleter
