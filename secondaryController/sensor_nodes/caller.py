#!/usr/bin/env python
from waterSensor import *
from muxconfig import *
from sub20 import *
from pressureSensor import *
from rangeSensor import *
from nutrientSensor import *

'''
val = getDistance(0)
print("front distance : " + str(val))

val = getDistance(1)
print("back distance : " + str(val))

val = getDistance(2)
print("left distance : " + str(val))

val = getDistance(3)
print("right distance : " + str(val))

val = getPressureLevel(0)
print("pressure level : " + str(val))
'''

val = getWaterLevel()
print("water level: " + str(val))

'''
val = getNutrientLevel()
print("nutrient level: " + str(val))
'''
'''
#open device 
devid = sub_open(0)
#enable ADC module
sub_adc_config(devid, 0x8040)#enable ADC with VCC ref
#enable mux GPIOPins as output mode
rt,status = sub_gpio_config(devid, 0x00F00000, 0x00F00000) # mask and set are the same for ouput mode
rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL1_PIN),muxmask)
 #read WATERLEVEL1 
rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
adcVal = adcRangeToValue(level)
print("adcVal - wl1 : " + str(adcVal))

rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL0_PIN),muxmask)
  #read WATERLEVEL0 
rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
adcVal = adcRangeToValue(level)
print("adcVal - wl0 : " + str(adcVal))
'''
'''
rt,status = sub_gpio_write(devid,0x00000000, 0x00F00000)
#read channel 0 
rt,level = sub_adc_single(devid,0)
adcVal = adcRangeToValue(level)
print("adcVal - C0 : " + str(adcVal))

rt,status = sub_gpio_write(devid,0x00200000, 0x00F00000)
#read channel 1 
rt,level = sub_adc_single(devid,0)
adcVal = adcRangeToValue(level)
print("adcVal - C1 : " + str(adcVal))

rt,status = sub_gpio_write(devid,0x00400000, 0x00F00000)
#read channel 2 
rt,level = sub_adc_single(devid,0)
adcVal = adcRangeToValue(level)
print("adcVal - C2 : " + str(adcVal))

'''


'''
rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL1_PIN),muxmask)
 #read WATERLEVEL1 
rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
adcVal = adcRangeToValue(level)
print("adcVal - wl1 : " + str(adcVal))

rt,status = sub_gpio_write(devid,getSelectValue(MUX_WATER_LEVEL0_PIN),muxmask)
  #read WATERLEVEL0 
rt,level = sub_adc_single(devid,ADC_MUX_SIGNAL_PIN)
adcVal = adcRangeToValue(level)
print("adcVal - wl0 : " + str(adcVal))
'''

'''
rt,level = sub_adc_single(devid,4)
adcVal = adcRangeToValue(level)
print("adcVal" + str(adcVal))
'''

