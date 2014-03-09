#!/usr/bin/env python

from ctypes import *
helper = cdll.LoadLibrary("./libsub.so")
dev_id = helper.sub_open(0)
helper.sub_lcd_write(dev_id, "\fHello\nworld")
helper.sub_close(dev_id).
print dev_id
