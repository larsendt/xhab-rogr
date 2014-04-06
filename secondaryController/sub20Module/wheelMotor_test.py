# !/usr/bin/python

from sub20 import *
import time
from wheelMotor_functions import *

devid = sub_open(0)
##sub_lcd_write(devid, "\fwe are\nawesome")

##Set step pins (GPIO24,25,26,27) to output state - step pin 1 
rt, config = sub_gpio_config(devid, 0x0F000000, 0x0F000000)

##step line should be low on start up - write 0 to GPIO24,25,26,27
rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
print "write 0 to step pin: " + str(hex(status.value))

##Set GPIO pins 16, 17, 18, 19, 20 in output mode - (en,dir,ms1,ms2,ms3)
rt, config = sub_gpio_config(devid, 0x00010000, 0x00010000)
print "config: " + str(hex(config.value))

rt, config = sub_gpio_config(devid, 0x00020000, 0x00020000)
print "config: " + str(hex(config.value))


#Make enable pin HIGH, direction pin LOW
## write 1 to GPIO16
rt,status = sub_gpio_write(devid,0x00010000,0x00010000)
print "write 1 to enable: " + str(hex(status.value))

## write 0 to GPIO17
rt,status = sub_gpio_write(devid,0x00000000,0x00020000)
print "write 0 to dir: " + str(hex(status.value))

## To run the motor
moveForward(1)
moveBackward(1)

## write low to step pins - GPIO24,25,26,27
rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
print "write 0 to step pin: " + str(hex(status.value))

## write HIGH to enable pin - GPIO16
rt,status = sub_gpio_write(devid,0x00010000,0x00010000)
print "write 1 to enable: " + str(hex(status.value))

sub_close(devid)
