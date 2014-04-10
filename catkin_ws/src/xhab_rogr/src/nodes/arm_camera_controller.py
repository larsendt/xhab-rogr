#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *

MAX_QUEUE = 25

class ArmCameraController(object):
    def __init__(self):
        print "ArmCameraController init"
        rospy.init_node("ArmCameraController")
        subtopic = "/tasks/rogr/armcamera"
        self.sub = rospy.Subscriber(subtopic, ArmCameraTask, self.callback)
        self.drive_queue = []

    def callback(self, msg):
        print "got msg"

    def spin(self):
        print "ArmCameraController listening"
        rospy.spin()


if __name__ == "__main__":
    try:
        c = ArmCameraController()
        c.spin()
    except rospy.ROSInterruptException:
        pass



