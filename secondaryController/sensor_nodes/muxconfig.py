#!/usr/bin/env python

from rogrpins import *
import ctypes

MAX_ADC = 1023
HIGH_ADC = 923
MIN_ADC = 0
LOW_ADC = 100
RESISTANCE = 330 ##27kom, need update when circuit change

#pressure sensor selection
PLEFT = 0
PRIGHT = 1

#four level sensor
LEVEL3 = 3
LEVEL2 = 2
LEVEL1 = 1
LEVEL0 = 0
ERROR3 = -4
ERROR3 = -3
ERROR2 = -2
ERROR1 = -1

#pump status
PUMP_ON = 1
PUMP_OFF = 0

def setpin(pin):
  output = 0x00000000
  output = output |( 1 << pin)
  return(output)

channelToValue = { MUX_WATER_LEVEL0_PIN: 0x00000000,
            MUX_WATER_LEVEL1_PIN: setpin(GPIO_MUX_S0_PIN),
            MUX_WATER_LEVEL2_PIN: setpin(GPIO_MUX_S1_PIN),
            MUX_NUTRIENT_LEVEL0_PIN: setpin(GPIO_MUX_S0_PIN)| setpin(GPIO_MUX_S1_PIN),
            MUX_NUTRIENT_LEVEL1_PIN: setpin(GPIO_MUX_S2_PIN),
            MUX_NUTRIENT_LEVEL2_PIN: setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S2_PIN),
            MUX_LEFT_PRESSURE_SENSOR_PIN: setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN),
            MUX_RIGHT_PRESSURE_SENSOR_PIN: setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN),
            }

muxmask = setpin(GPIO_MUX_ENABLE_PIN) | setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN)

def getSelectValue(pin):
  return(channelToValue[pin])


def adcRangeToValue(val):
  adcval = val.value
  #print "adcvalue: " + str(adcval)

  if(adcval <= MAX_ADC and adcval >= HIGH_ADC):
    return(1)
  elif(adcval >= MIN_ADC and adcval <= LOW_ADC):
    return(0)
  else:
    return(-1)
  '''
  if(adcval <= 50 and adcval >= 0):
    return(0)
  elif(adcval >= 70):
    return(1)
  else:
    return(-1)
  '''





