#!/usr/bin/env python

from rogrpins import *

MAX_ADC = 1023
HIGH_ADC = 923
MIN_ADC = 0
LOW_ADC = 100

LEVEL3 = 3
LEVEL2 = 2
LEVEL1 = 1
LEVEL0 = 0
ERROR2 = -3
ERROR1 = -2
ERROR0 = -1

def setpin(pin):
  output = 0x00000000
  output = output |( 1 << pin)
  return(output)

channelToValue = { 0: 0x00000000,
            1: setpin(GPIO_MUX_S0_PIN),
            2: setpin(GPIO_MUX_S1_PIN),
            3: setpin(GPIO_MUX_S0_PIN)| setpin(GPIO_MUX_S1_PIN),
            4: setpin(GPIO_MUX_S2_PIN),
            5: setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S2_PIN),
            6: setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN),
            7: setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN),
            }
            
muxmask = hex(setpin(GPIO_MUX_ENABLE_PIN) | setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN))

def getSelectValue(pin):
  return(hex(channelToValue[pin]))
  

def adcrangeToValue(adcval):
  if(adcval <= MAX_ADC and adcval >= HIGH_ADC):
    return(1)
  elif(adcval >= MIN_ADC and adcval <= LOW_ADC):
    return(0)
  else:
    return(-1)
  


            

 
