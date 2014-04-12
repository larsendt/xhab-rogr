#!/usr/bin/env python


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
            
channelToMask = setpin(GPIO_MUX_ENABLE_PIN) | setpin(GPIO_MUX_S0_PIN) | setpin(GPIO_MUX_S1_PIN) | setpin(GPIO_MUX_S2_PIN)


            

 
