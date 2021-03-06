#!/usr/bin/env python

import sys
from sub20 import *
from rogrpins import *
from muxconfig import *


def getWaterLevel():
  #open device
  devid = sub_open(0)
  #enable ADC module
  sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
  #enable mux GPIOPins as output mode
  rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
  #set WATERLEVEL2 select line
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL2_PIN),muxmask)
  #read WATERLEVEL2
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  waterlevel = adcRangeToValue(level)
  print 1
  print waterlevel
  if(waterlevel == 0): #if 0 then waterlevel is 3
    sub_close(devid)
    return(LEVEL3)
  elif(waterlevel == -1):#error in reading adc value
    sub_close(devid)
    return(ERROR3)
  #set WATERLEVEL1 select line
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL1_PIN),muxmask)
  #read WATERLEVEL1
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  waterlevel = adcRangeToValue(level)
  print 2
  print waterlevel
  if(waterlevel == 0):#if 0 then waterlevel is 2
    sub_close(devid)
    return(LEVEL2)
  elif(waterlevel == -1): #error in reading adc value
    sub_close(devid)
    return(ERROR2)
  #set WATERLEVEL1 select line
  rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL0_PIN),muxmask)
  #read WATERLEVEL1
  rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
  waterlevel = adcRangeToValue(level)
  print 3
  print waterlevel
  if(waterlevel == 0): #if 0 then waterlevel is 1
    sub_close(devid)
    return(LEVEL1)
  elif(waterlevel == 1): #if 1 water level is 0
    sub_close(devid)
    return(LEVEL0)
  else:
    sub_close(devid)
    return(ERROR1) #error in reading adc value

def setWaterPumpStatus(status):#GPIO12
  #open device
  devid = sub_open(0)
  sub_gpio_config(devid,0x00001000,0x00001000)
  if(status == PUMP_ON): #turn on pump
	sub_gpio_write(devid,0x00001000,0x00001000)
  elif(status == PUMP_OFF):
	sub_gpio_write(devid,0x00000000,0x00001000)
  else:
    sub_close(devid)
    return(ERROR4) #error in setting gpio status

getWaterLevel()
