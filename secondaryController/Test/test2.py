# !/usr/bin/python

from sub20 import *
import time

devid = sub_open(0)
sub_lcd_write(devid, "\fwe are\nawesome")

##Set PWM resolution=10ms, limit=100, frequency=1Hz 
rt = sub_pwm_config(devid, 10000, 100)
 

##Set PWM_0 pin (GPIO24) to output state 
rt, config = sub_gpio_config(devid, 0x01000000, 0x01000000)

 
##Output 50% duty cycle on PWM_0 pin 
rt = sub_pwm_set(devid, 0, 50 )




'''
rt, config = sub_gpio_config(devid, 0x00001000, 0x00001000)
print "config: " + str(hex(config.value))

rt,status = sub_gpio_write(devid,0x00001000,0x00001000)
print "write 1: " + str(hex(status.value))


time.sleep(1)


rt,status = sub_gpio_write(devid,0x00000000,0x00001000)
print "write 2: " + str(hex(status.value))


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
