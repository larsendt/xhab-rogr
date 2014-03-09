#!/usr/bin/env python

from ctypes import *
helper = cdll.LoadLibrary("./libsub.so")
dev_id = helper.sub_open(0)
##helper.sub_lcd_write(dev_id, "\fHello\nworld")
##helper.sub_close(dev_id).
##print dev_id
INTP = POINTER(c_int)
num = c_int(0)
addr = addressof(num)
ptr = cast(addr, INTP)
rval = helper.sub_gpio_config(dev_id, 0x80, ptr,0xFF)
print ptr[0]
print rval
helper.sub_close(dev_id)
