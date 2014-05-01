#!/usr/bin/env python

import sys
import rospy
import time
from xhab_rogr.msg import *
from pressureSensor import *
from muxconfig import *
from sub20 import *
from rogrpins import *

PUB_DELAY = 15

class PressureSensor(object):
    def __init__(self):
        print "PressureSensor init"
        rospy.init_node("PressureSensor")
        subtopic = "/tasks" + "/rogr" + "/pressure"
        pubtopic = "/tasks" + "/rogr" + "/pressure" 
        self.sub = rospy.Subscriber(subtopic, Data, self.callback)
        self.pressure = 0
        self.devid = init()
                 
    def callback(self, msg):
        self.pressure = getPressureLevel(self.devid,msg.pressure_sensor_id)
        print "Received pressure sensor id"
       
    def spin(self):
        print "PressureSensor listening"
        time.sleep(PUB_DELAY)
        rospy.spin()
           

if __name__ == "__main__":
    try:
        p = PressureSensor()
        p.spin()
    except rospy.ROSInterruptException:
        pass
