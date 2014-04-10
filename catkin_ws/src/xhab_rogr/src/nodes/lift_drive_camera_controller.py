#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *

MAX_QUEUE = 25

class LiftDriveCameraController(object):
    def __init__(self):
        print "LiftDriveCameraController init"
        rospy.init_node("LiftDriveCameraController")
        subtopic = "/tasks/rogr/liftdrivecamera"
        self.sub = rospy.Subscriber(subtopic, LiftDriveCameraTask, self.callback)
        self.drive_queue = []

    def callback(self, msg):
        print "got msg"

    def spin(self):
        print "LiftDriveCameraController listening"
        rospy.spin()


if __name__ == "__main__":
    try:
        c = LiftDriveCameraController()
        c.spin()
    except rospy.ROSInterruptException:
        pass



