#!/usr/bin/env python

import sys
import rospy
import time
from xhab_rogr.msg import *
from camera_turret import *
from muxconfig import *
from sub20 import *
from rogrpins import *

PUB_DELAY = 15

class CameraTurretController(object):
    def __init__(self):
        print "CameraTurret init"
        rospy.init_node("CameraTurretController")
        subtopic = "/tasks" + "/rogr" + "/cameraturret"
        pubtopic = "/tasks" + "/rogr" + "/cameraturret"
        self.sub = rospy.Subscriber(subtopic, Data, self.callback)
        self.hndl = initTurret() 
                       
    def callback(self, msg):
        moveTurret(self.hndl,msg.tilt,msg.pan)
        print "Received camera turret pan and tilt"

    def spin(self):
        print "CameraTurretController listening"
        rospy.spin()


if __name__ == "__main__":
    try:
        p = CameraTurretController()
	p.spin()

    except rospy.ROSInterruptException:
        pass
