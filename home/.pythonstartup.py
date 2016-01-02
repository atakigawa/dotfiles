#!/usr/bin/env python
try:
    import os
    import readline
    import atexit

    # hist file
    histfile = os.path.join(os.environ["HOME"], ".pyhist")
    # make sure file exists
    open(histfile, 'a').close()
    readline.read_history_file(histfile)
    readline.set_history_length(500)
    atexit.register(readline.write_history_file, histfile)

    del os, readline, atexit
except IOError:
    pass
