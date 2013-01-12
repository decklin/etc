from __future__ import print_function

import sys
import os
import atexit
import readline
import rlcompleter
import platform

sys.ps1 = '>>> '
sys.ps2 = '    '

historyPath = os.path.expanduser('~/.python/history')
inputrcPath = os.path.expanduser('~/.python/inputrc')

if os.path.exists(historyPath):
    readline.read_history_file(historyPath)

def save_history(historyPath=historyPath):
    import readline
    readline.write_history_file(historyPath)

atexit.register(save_history)

# Try to guess if this is an Apple-shipped Python, which will have GNU
# Readline replaced with editline.

if platform.python_compiler().endswith('(tags/Apple/clang-418.0.60)'):
    readline.parse_and_bind('bind ^I rl_complete')
else:
    if os.path.exists(inputrcPath):
        readline.read_init_file(inputrcPath)

del sys, os, atexit, readline, rlcompleter, platform
