#!/usr/bin/env python

from sub20 import *
from rogrpins import *
from muxconfig import *



def getPressureLevel(direction):
  #open device 	
  devid = sub_open(0)
  #enable ADC with VCC ref
  sub_adc_config(devid, 0x8040)
  #enable mux GPIOPins as output mode
  rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
  #set PRESSURESENSOR select line
  if(direction == PLEFT):
    selectval = getSelectValue(MUX_LEFT_PRESSURE_SENSOR_PIN)
  elif(direction == PRIGHT):
    selectval = getSelectValue(MUX_RIGHT_PRESSURE_SENSOR_PIN)
  else:
    return(-1)
  rt,status = sub_gpio_write(devid,selectval,muxmask)
  #read READPRESSURELEVEL 
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  #calibration, depends on circuit, value in resistance
  real_force = ((float)(RESISTANCE*level.value)/(1-(level.value/MAX_ADC)))
  return real_force
	
	
	