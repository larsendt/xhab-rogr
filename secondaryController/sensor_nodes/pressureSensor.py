#!/usr/bin/env python

from sub20 import *
from rogrpins import *
from muxconfig import *

LEFT = 0
RIGHT = 1

RESISTANCE = 27000 ##27kom

def getPressureLevel(direction):
  #open device 	
  devid = sub_open(0)
  #enable ADC module
  sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
  #enable mux GPIOPins as output mode
  rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
  #set PRESSURESENSOR select line
  if(direction == LEFT):
    selectval = getSelectValue(MUX_LEFT_PRESSURE_SENSOR_PIN)
  elif(direction == RIGHT):
    selectval = getSelectValue(MUX_RIGHT_PRESSURE_SENSOR_PIN)
  else:
    return(-1)
  rt,status = sub_gpio_write(devid,selectval,muxmask)
  #read READPRESSURELEVEL 
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  #calibration
  real_force = ((float)(RESISTANCE*level)/(1-(level/MAX_ADC)))
  return real_force
	
	
	
