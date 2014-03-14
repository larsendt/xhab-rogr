#!/usr/bin/env python


from ctypes import *
from ctypes.util import find_library
import os.path
import sys
import numpy
liblocation = find_library("sub")
if not liblocation:
    raise StandardError("failed to locate libsub library")
subpath = os.path.dirname(liblocation)
subfile = os.path.basename(liblocation)

#pointer to actual library file
sublib = numpy.ctypeslib.load_library(subfile,subpath)


#helper = cdll.LoadLibrary("./libsub.so")
dev_id = sublib.sub_open(0)
sublib.sub_lcd_write(dev_id, "\fAwesome\nworld")
sublib.sub_close(dev_id)
print dev_id
