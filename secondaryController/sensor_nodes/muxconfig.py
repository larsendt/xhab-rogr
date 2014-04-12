#!/usr/bin/env python

MAX_ADC = 1023
HIGH_ADC = 923
MIN_ADC = 0
LOW_ADC = 100

def setpin(output,pin):
  output = 0x00000000
  output = output |( 1 << pin)
  return(output)

channelToValue = { 0: 0x00000000,
            1: setgiopin(GPIO_MUX_S0_PIN),
            2: setgpiopin(GPIO_MUX_S1_PIN),
            3: setgpiopin(GPIO_MUX_S0_PIN)| setgpiopin(GPIO_MUX_S1_PIN),
            4: setgpiopin(GPIO_MUX_S2_PIN),
            5: setgpiopin(GPIO_MUX_S0_PIN) | setgpiopin(GPIO_MUX_S2_PIN),
            6: setgpiopin(GPIO_MUX_S1_PIN) | setgpiopin(GPIO_MUX_S2_PIN),
            7: setgpiopin(GPIO_MUX_S0_PIN) | setgpiopin(GPIO_MUX_S1_PIN) | setgpiopin(GPIO_MUX_S2_PIN),
            }
            
muxmask = setpin(GPIO_MUX_ENABLE_PIN) | setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN)



def adcrangeToValue(adcval):
  if(adcval <= MAX_ADC and adcval >= HIGH_ADC):
    return(1)
  elif(adcval >= MIN_ADC and adcval <= LOW_ADC):
    return(0)
  else:
    return(-1)
  


            

 
