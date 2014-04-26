#!/usr/bin/env python

import sys
import rospy
from xhab_rogr.msg import *
import time
import random

PUB_DELAY = 15

class DistanceSensor(object):
    def __init__(self):
        print "DistanceSensor init"
        rospy.init_node("DistanceSensor")
        subtopic = "/tasks" + "/rogr" + "/distance"
        pubtopic = "/data" + "/rogr" + "/distance"
        self.pub = rospy.Publisher(pubtopic, Data)
        self.sub = rospy.Subscriber(subtopic, DistanceTask, self.callback)
        self.id = 1
        self.reading = 7.0


    def callback(self, msg):
        print "got msg, target =", msg.target
        print "read distance value:", self.reading

    def spin(self):
        print "DistanceSensor listening"
        while not rospy.is_shutdown():
            pubmsg = Data()
            pubmsg.property = "distance"
            pubmsg.timestamp = rospy.Time.now()
            pubmsg.sensor_id = self.id
            pubmsg.value = self.reading
            self.pub.publish(pubmsg)
            print "Published sensor id:", self.id
            print "Published distance:", self.reading
            time.sleep(PUB_DELAY)


if __name__ == "__main__":
    try:
        p = DistanceSensor()
        p.spin()
    except rospy.ROSInterruptException:
        pass
