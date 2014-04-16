#!/usr/bin/env python

import sys
from sub20 import *
from rogrpins import *
from muxconfig import *

MAX_VOLT = 5
MAX_ADC = 1023

getBatteryInfo():
  #open device 
  devid = sub_open(0)
  #enable ADC module
  sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
  #read LEVEL
  rt,battery_level = sub_adc_single(devid,ADC_BATTERY_LEVEL_PIN)
  #read STATUS1 
  rt,status1 = sub_adc_single(devid,ADC_BATTERY_STATUS_PIN_1)
  #read STATUS2
  rt,status1 = sub_adc_single(devid,ADC_BATTERY_STATUS_PIN_2)
  #calculate battery charge
  if (status1 > 300) and (status2 < 50):
    battery_charge = "charging"
  elif (status1 < 50) and (status2 > 300):
    battery_charge = "fully charged"
  else:
    battery_charge = "no battery detected"
  #close the device		
  sub_close(devid)
  return(battery_charge,battery_level)
  
  
