# !/usr/bin/python

from sub20 import *
import time

def moveForward(distance):
    rotations = distance/0.478
    numberOfSteps = rotations * 5400
    ## write 1 to GPIO16
    rt,status = sub_gpio_write(devid,0x00010000,0x00010000)
    print "write 1 to enable: " + str(hex(status.value))
    ## write 1 to GPIO17 - HIGH to dir pin
    rt,status = sub_gpio_write(devid,0x00020000,0x00020000)
    print "write 1 to dir: " + str(hex(status.value)) 
    ## write LOW to enable pin - GPIO 16
    rt,status = sub_gpio_write(devid,0x00000000,0x00010000)
    print "write 0 to enable: " + str(hex(status.value))
    for x in range(0,numberOfSteps):
        rt,status = sub_gpio_write(devid,0x0F000000,0x0F000000)
        print "write 0 to step pin: " + str(hex(status.value))
        time.sleep(0.00008)
        rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
        print "write 0 to step pin: " + str(hex(status.value))
        time.sleep(0.00008)

def moveBackward(distance):
    rotations = distance/0.478
    numberOfSteps = rotations * 5400
    ## write 1 to GPIO16
    rt,status = sub_gpio_write(devid,0x00010000,0x00010000)
    print "write 1 to enable: " + str(hex(status.value))
    ## write 1 to GPIO17 - LOW to dir pin
    rt,status = sub_gpio_write(devid,0x00000000,0x00020000)
    print "write 1 to dir: " + str(hex(status.value)) 
    ## write LOW to enable pin - GPIO 16
    rt,status = sub_gpio_write(devid,0x00000000,0x00010000)
    print "write 0 to enable: " + str(hex(status.value))
    for x in range(0,numberOfSteps):
        rt,status = sub_gpio_write(devid,0x0F000000,0x0F000000)
        print "write 0 to step pin: " + str(hex(status.value))
        time.sleep(0.00008)
        rt,status = sub_gpio_write(devid,0x00000000,0x0F000000)
        print "write 0 to step pin: " + str(hex(status.value))
        time.sleep(0.00008)
