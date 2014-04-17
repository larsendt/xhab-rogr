# !/usr/bin/python

import time
import sys
from sub20 import *
from rogrpins import *

# pan servo connected to GPIO28 -> PWM_4
# tilt servo connected to GPIO29 -> PWM_5

# PWM period equal to 0.5 ms corresponds to full CW , i.e. 0 deg
	# pan and tilt value as '10' correspond to '0' deg
# PWM period equal to 1.5 ms corresponds to 90 deg
# PWM period equal to 2.5 ms corresponds to full CCW , i.e. 180 deg
	#pan and tilt value as '50' correspond to '180' deg

# pan and tilt increment or decrement by 1 correspond to 4.5 deg angle increment or degrement

def initTurret():
	hndl = sub_open(0)

        # Set PWM resolution=50us, limit=250, frequency=80Hz */
	i = sub_pwm_config( hndl, 50, 250 )
	#* Set PWM_4 and PWM_5 pin (GPIO28 & GPIO29) to output state */
	i = sub_gpio_config( hndl, 0x30000000, 0x30000000 )

	# set values to 90 degree angle to keep the camera centered
	pan = 30
	tilt = 30
	sub_pwm_set( hndl, 4, pan )
	sub_pwm_set( hndl, 5, tilt )
	return hndl

def moveTurret(hndl,panangle,tiltangle):
	pan = int(float(panangle*40/180) + 10)
	tilt = int(float(tiltangle*40/180) + 10)
	# tilt down
	if (tilt <= 50 and tilt >= 10):
		i = sub_pwm_set( hndl, 5, tilt )
	time.sleep(0.1)

	if (pan <= 50 and pan >= 10):
		i = sub_pwm_set( hndl, 4, pan )
	time.sleep(0.1)

#sub = initTurret()
#moveTurret(sub, 180, 180 )

