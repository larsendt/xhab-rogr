# !/usr/bin/python

import time
import sys
from getchclass import *
from sub20 import *

# pan servo connected to GPIO28 -> PWM_4
# tilt servo connected to GPIO28 -> PWM_5

# PWM period equal to 0.5 ms corresponds to full CW , i.e. 0 deg
	# pan and tilt value as '10' correspond to '0' deg
# PWM period equal to 1.5 ms corresponds to 90 deg
# PWM period equal to 2.5 ms corresponds to full CCW , i.e. 180 deg
	#pan and tilt value as '50' correspond to '180' deg

# pan and tilt increment or decrement by 1 correspond to 4.5 deg angle increment or degrement

def moveServo(hndl,pan,tilt,servodir):
	# tilt down
	if servodir == 4:
		if tilt < 50:
			tilt = tilt+1
		i = sub_pwm_set( hndl, 5, tilt )
		time.sleep(0.1)
	# tilt up
	elif servodir == 3:
		if tilt > 10:
			tilt = tilt-1
		i = sub_pwm_set( hndl, 5, tilt )
		time.sleep(0.1)
	#pan left
	elif servodir == 2:
		if pan < 50:
			pan = pan+1
		i = sub_pwm_set( hndl, 4, pan )
		time.sleep(0.1)
	#pan right
	elif servodir == 1:
		if pan > 10:
			pan = pan-1
		i = sub_pwm_set( hndl, 4, pan )
		time.sleep(0.1)

	panangle = float(pan - 10)*180/40
	tiltangle = float(tilt - 10)*180/40
	print "pan = "+`panangle`+" tilt = "+`tiltangle`
	return (pan,tilt)

def main():
	hndl = sub_open(0)

        # Set PWM resolution=50ms, limit=250, frequency=80Hz */
	i = sub_pwm_config( hndl, 50, 250 )
	#* Set PWM_4 and PWM_5 pin (GPIO28 & GPIO29) to output state */
	i = sub_gpio_config( hndl, 0x30000000, 0x30000000 )

        panright = 1  #angle decrement 'd'
        panleft = 2 #angle increment 'a'
        tiltup = 3  #angle decrement 'w'
        tiltdown = 4  #angle increment 's'

	# set values to 90 degree angle to keep the camera centered
	pan = 30
	tilt = 30
	sub_pwm_set( hndl, 4, pan )
	sub_pwm_set( hndl, 5, tilt )

	print "press: \n1.'a' to move camera to left\n2. 'd' to move camera to right\n3.'w' to tilt camera upwards\n4. 's' to tilt camera downwards...." 

	while True:
    		char = getch()
		#pressing s for tilt down
                if ord(char)==115:
			pan, tilt = moveServo(hndl,pan,tilt,tiltdown)
		#pressing w for tilt up
                elif ord(char)==119:
			pan, tilt = moveServo(hndl,pan,tilt,tiltup)
		#pressing 'd' for pan right
                elif ord(char)==100:
			pan, tilt = moveServo(hndl,pan,tilt,panright)
		#pressing a for pan left
                elif ord(char)==97:
			pan, tilt = moveServo(hndl,pan,tilt,panleft)
		#pressing escape for stopping
		elif ord(char)==27:
			break

	time.sleep(1)
	sub_pwm_set( hndl, 4, 0 )
	sub_pwm_set( hndl, 5, 0 )
	i = sub_close(hndl)
main()
	

