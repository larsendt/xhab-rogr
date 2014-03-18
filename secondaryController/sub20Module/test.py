#!/usr/bin/python
from sub20 import *
import time

devid = sub_open(0)
sub_lcd_write(devid, "\fwe are\nawesome")
rt, config = sub_gpio_config(devid, 0xFFFF, 0xFFFF)
print "config: " + str(hex(config.value))

rt,status = sub_gpio_write(devid,0xFFFF,0xFFFF)
print "write 1: " + str(hex(status.value))

time.sleep(1)

rt,status = sub_gpio_write(devid,0x0000,0xFFFF)
print "write 2: " + str(hex(status.value))

'''
rt,status = sub_gpio_read(devid)
print "read 1: " + str(hex(status.value))

rt,status = sub_gpio_write(devid,0x01,0xFF)
print "write 1: " + str(hex(status.value))

rt,status = sub_gpio_read(devid)
print "read 2: " + str(hex(status.value))

rt,status = sub_gpio_write(devid,0x80,0xFF)
print "write 2 " + hex(status.value)

rt,status = sub_gpio_read(devid)
print "read 3 " + hex(status.value)
'''

sub_close(devid)
