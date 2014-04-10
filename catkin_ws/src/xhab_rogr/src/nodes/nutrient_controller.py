#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *

class NutrientController(object):
    def __init__(self):
        print "NutrientController init"
        rospy.init_node("NutrientController")
        subtopic = "/tasks/rogr/nutrientpump"
        self.sub = rospy.Subscriber(subtopic, NutrientPumpTask, self.callback)

    def callback(self, msg):
        print "callback"
        if msg.pump_on:
            print "pump on"
        else:
            print "pump off"

    def spin(self):
        print "NutrientController listening"
        rospy.spin()


if __name__ == "__main__":
    c = NutrientController()
    c.spin()
