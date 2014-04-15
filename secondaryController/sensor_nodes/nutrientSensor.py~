#!/usr/bin/env python
 
import sys
from sub20 import *
from rogrpins import *
from muxconfig import *

def getNutrientLevel():
  #open device 
  devid = sub_open(0)
  #enable ADC module
  sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
  #enable mux GPIOPins as output mode
  rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
  #set NUTRIENTLEVEL2 select line 
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_NUTRIENT_LEVEL2_PIN),muxmask)
  #read NUTRIENTLEVEL2 
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  level = adcRangeToValue(level)
  if(level == 0): #if 0 then nutrientlevel is 3
    sub_close(devid)
    return(LEVEL3)
  elif(level == -1):#error in reading adc value
    sub_close(devid)
    return(ERROR3)
  #set NUTIRENTLEVEL1 select line 
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_NUTRIENT_LEVEL1_PIN),muxmask)
  #read NUTRIENTLEVEL1 
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  level = adcRangeToValue(level)
  if(level == 0): #if 0 then nutrientlevel is 2
    sub_close(devid)
    return(LEVEL2)
  elif(level == -1): #error in reading adc value
    sub_close(devid)
    return(ERROR2)
  #set NUTIRENTLEVEL0 select line 
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_NUTRIENT_LEVEL0_PIN),muxmask)
  #read NUTRIENTLEVEL0 
  level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  level = adcRangeToValue(level)
  if(level == 0): #if 0 then nutrientlevel is 1
    sub_close(devid)
    return(LEVEL1)
  elif(level == 1): #if 1 nutrient level is 0
    sub_close(devid)
    return(LEVEL0)
  else:
    sub_close(devid)
    return(ERROR1) #error in reaading adc value

def setNutrientPumpStatus(status):#GPIO13
  #open device 
  devid = sub_open(0) 
  sub_gpio_config(devid,0x00002000,0x00002000)
  if(status == PUMP_ON): #turn on pump
	sub_gpio_write(devid,0x00002000,0x00002000)
  elif(status == PUMP_OFF):
	sub_gpio_write(devid,0x00000000,0x00002000)
  else:
    sub_close(devid)
    return(ERROR4) #error in setting gpio status
    
