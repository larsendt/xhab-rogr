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

'''
rt, config = sub_gpio_config(devid, 0x00040000, 0x00040000)
print "config: " + str(hex(config.value))

rt, config = sub_gpio_config(devid, 0x00080000, 0x00080000)
print "config: " + str(hex(config.value))

rt, config = sub_gpio_config(devid, 0x00100000, 0x000100000)
print "config: " + str(hex(config.value))

'''

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

'''
## if the number of steps is > 0, write HIGH to dir pin - GPIO17
## write 1 to GPIO17
rt,status = sub_gpio_write(devid,0x00000000,0x00020000)
print "write 1 to dir: " + str(hex(status.value)) 

##For step size = 1, write LOW to ms1, ms2, ms3 - GPIO pins 18, 19, 20
rt,status = sub_gpio_write(devid,0x00000000,0x00040000)
print "write 0 to ms1: " + str(hex(status.value))

rt,status = sub_gpio_write(devid,0x00000000,0x00080000)
print "write 0 to ms2: " + str(hex(status.value))

rt,status = sub_gpio_write(devid,0x00000000,0x00100000)
print "write 0 to ms3: " + str(hex(status.value))


## write LOW to enable pin - GPIO 16
rt,status = sub_gpio_write(devid,0x00000000,0x00010000)
print "write 0 to enable: " + str(hex(status.value))

for x in range(0,20000):
    rt,status = sub_gpio_write(devid,0x0F000000,0x0F000000)
    print "write 0 to step pin: " + str(hex(status.value))
    time.sleep(0.00008)
    rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
    print "write 0 to step pin: " + str(hex(status.value))
    time.sleep(0.00008)
    

##pwm to step pin
##Set PWM resolution=40microseconds, limit=20, frequency=1.25KHz 
rt = sub_pwm_config(devid, 1000, 100)

##Set PWM_0 pin (GPIO24) to output state 
rt, config = sub_gpio_config(devid, 0x01000000, 0x01000000)
 
##Output 50% duty cycle on PWM_0 pin 
rt = sub_pwm_set(devid, 0, 50 )

## sleep for the number of steps
time.sleep(5)

## disable PWM mode
rt = sub_pwm_config(devid, 100, 0)
'''

## write low to step pins - GPIO24,25,26,27
rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
print "write 0 to step pin: " + str(hex(status.value))

## write HIGH to enable pin - GPIO16
rt,status = sub_gpio_write(devid,0x00010000,0x00010000)
print "write 1 to enable: " + str(hex(status.value))

sub_close(devid)
