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

#*_raw are python objects that points to corresponding c functions in the c library.
sub_open_raw = sublib.sub_open
sub_lcd_write_raw = sublib.sub_lcd_write
sub_close_raw = sublib.sub_close


#python function argument types
sub_open_raw.argtypes = [c_int]
sub_lcd_write_raw.argtypes = [c_int,c_char_p]
sub_close_raw.argtypes = [c_int]

#python function wrapper definitions
def sub_open(hndl):
    devid = c_int()
    devid = sub_open_raw(hndl)
    return(devid)
    
def sub_lcd_write(devid, string):
    rt = c_int()
    rt = sub_lcd_write_raw(devid,string)
    return(rt)

def sub_close(devid):
    rt = c_int()
    rt = sub_close_raw(devid,byref(rt))
    return(rt)


