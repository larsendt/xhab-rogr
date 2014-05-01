#!/usr/bin/env python

import sys
import rospy
import time
from xhab_rogr.msg import *
from nutrientSensor import *
from muxconfig import *
from sub20 import *
from rogrpins import *

PUB_DELAY = 15

class NutrientPumpController(object):
    def __init__(self):
        print "NutrientPumpController init"
        rospy.init_node("NutrientPumpController")
        subtopic = "/tasks" + "/rogr" + "/nutrientpump"
        pubtopic = "/tasks" + "/rogr" + "/nutrientpump"
        self.sub = rospy.Subscriber(subtopic, Data, self.callback)
        self.devid = init()
        
    def callback(self, msg):
        setNutrientPumpStatus(self.devid,msg.nutrient_pump_status)
        print "Received nutrient pump status"
                       
    def spin(self):
        print "NutrientPumpController listening"
        time.sleep(PUB_DELAY)
        rospy.spin()

if __name__ == "__main__":
    try:
        c = NutrientPumpController()
        c.spin()
    except rospy.ROSInterruptException:
        pass
