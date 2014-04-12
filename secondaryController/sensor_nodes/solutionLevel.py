#!/usr/bin/env python

import sys
import rospy
from sub20 import *
from rogrpins import *
from muxconfig import *
from 	std_msgs.msg import String

dev_id = sub_open(0)
MAX_ADC = 1023
MAX_VOLT = 5

LEVEL3 = 3
LEVEL2 = 2
LEVEL1 = 1
LEVEL0 = 0
ERROR2  = -3
ERROR1 = -2
ERROR0 = -1


def solutionLevel(solution):
  
  if(solution == 0): #the solution is water
    #enable ADC module
    sub_adc_config(dev_id, 0x8040)#enable ADC with VCC ref
    #enable mux GPIOPins as output mode
    rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
    #set WATERLEVEL2 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_WATER_LEVEL2_PIN](),muxmask)
    #read WATERLEVEL2 
    waterlevel = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(waterlevel == 0): #if 0 then waterlevel is 3
      return(LEVEL3);
    elif(waterlevel == -1):#error in reading adc value
      return(ERROR3);
    #set WATERLEVEL1 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_WATER_LEVEL1_PIN](),muxmask)
    #read WATERLEVEL1 
    waterlevel = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(waterlevel == 0): #if 0 then waterlevel is 2
      return(LEVEL2);
    elif(waterlevel == -1): #error in reading adc value
      return(ERROR2);
    #set WATERLEVEL1 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_WATER_LEVEL0_PIN](),muxmask)
    #read WATERLEVEL1 
    waterlevel = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(waterlevel == 0): #if 0 then waterlevel is 1
      return(LEVEL1);
    elif(waterlevel == 1): #if 1 water level is 0
      return(LEVEL0);
    else
      return(ERROR1) #error in reaading adc value
    
  elif(solution == 1): #the solution is nutrient
    #enable ADC module
    sub_adc_config(dev_id, 0x8040)#enable ADC with VCC ref
    #enable mux GPIOPins as output mode
    rt,status = sub_gpio_config(devid, muxmask, muxmask) # mask and set are the same for ouput mode
    #set NUTRIENTLEVEL2 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_NUTRIENT_LEVEL2_PIN](),muxmask)
    #read NUTRIENTLEVEL2 
    level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(level == 0): #if 0 then nutrientlevel is 3
      return(LEVEL3);
    elif(level == -1):#error in reading adc value
      return(ERROR3);
    #set NUTIRENTLEVEL1 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_NUTRIENT_LEVEL1_PIN](),muxmask)
    #read NUTRIENTLEVEL1 
    level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(level == 0): #if 0 then nutrientlevel is 2
      return(LEVEL2);
    elif(level == -1): #error in reading adc value
      return(ERROR2);
    #set NUTIRENTLEVEL1 select line 
    rt,status = sub_gpio_write(devid,channelToValue[MUX_NUTRIENT_LEVEL0_PIN](),muxmask)
    #read NUTRIENTLEVEL1 
    level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
    if(level == 0): #if 0 then nutrientlevel is 1
      return(LEVEL1);
    elif(level == 1): #if 1 nutrient level is 0
      return(LEVEL0);
    else
      return(ERROR1) #error in reaading adc value
    

