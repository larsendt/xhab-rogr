#!/usr/bin/env python

from ctypes import *
helper = cdll.LoadLibrary("./libsub.so")
dev_id = helper.sub_open(0)
INTP = POINTER(c_int)
num = c_int(0)
addr = addressof(num)
ptr = cast(addr, INTP)
rval = helper.sub_gpio_config(dev_id, 0x80, addr ,0xFF)
print num
print rval
helper.sub_close(dev_id)
