#!/usr/bin/env python

from sub20 import *
from rogrpins import *
from muxconfig import *

FRONT = 0
BACK = 1
LEFT = 2
RIGHT = 3

def getDistance(direction):
  #open device 	
  devid = sub_open(0)
  #enable ADC module
  sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
  #set PRESSURESENSOR select line
  if(direction == FRONT):
    adcpin = ADC_FRONT_RANGE_PIN
  elif(direction == BACK):
    adcpin = ADC_BACK_RANGE_PIN
  elif(direction == LEFT):
    adcpin = ADC_LEFT_RANGE_PIN
  else:
    adcpin = ADC_RIGHT_RANGE_PIN
  #read getdistance
  rt,level = sub_adc_single(devid,adcpin)
  return level
  
  

