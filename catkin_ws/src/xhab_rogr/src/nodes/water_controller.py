#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *

class WaterController(object):
    def __init__(self):
        print "WaterController init"
        rospy.init_node("WaterController")
        subtopic = "/tasks/rogr/waterpump"
        self.sub = rospy.Subscriber(subtopic, WaterPumpTask, self.callback)

    def callback(self, msg):
        print "callback"
        if msg.pump_on:
            print "pump on"
        else:
            print "pump off"

    def spin(self):
        print "WaterController listening"
        rospy.spin()


if __name__ == "__main__":
    c = WaterController()
    c.spin()
