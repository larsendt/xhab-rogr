#!/usr/bin/env python

import sys
import rospy
from xhab_rogr.msg import *
import time
import random

PUB_DELAY = 15

class PressureSensor(object):
    def __init__(self):
        print "PressureSensor init"
        rospy.init_node("PressureSensor")
        subtopic = "/tasks" + "/rogr" + "/pressure"
        pubtopic = "/data" + "/rogr" + "/pressure"
        self.pub = rospy.Publisher(pubtopic, Data)
        self.sub = rospy.Subscriber(subtopic, PressureTask, self.callback)
        self.reading = 7.0
            

    def callback(self, msg):
        print "got msg, target =", msg.target
        print "read pressure value:", self.reading

    def spin(self):
        print "PressureSensor listening"
        while not rospy.is_shutdown():
            pubmsg = Data()
            pubmsg.source = "rogr"
            pubmsg.property = "pressure"
            pubmsg.timestamp = rospy.Time.now()
            pubmsg.value = self.reading
            self.pub.publish(pubmsg)
            print "Published pressure:", self.reading
            time.sleep(PUB_DELAY)


if __name__ == "__main__":
    try:
        p = PressureSensor()
        p.spin()
    except rospy.ROSInterruptException:
        pass
