#!/usr/bin/env python

import rospy
import time
from xhab_rogr.msg import *

PUB_DELAY = 15

class WaterMonitor(object):
    def __init__(self):
        "WaterMonitor init"
        rospy.init_node("WaterMonitor")
        subtopic = "/tasks/rogr/watertank"
        pubtopic = "/data/rogr/watertank"
        self.sub = rospy.Subscriber(subtopic, WaterTankTask, self.callback)
        self.pub = rospy.Publisher(pubtopic, Data)
        self.water_level = 0

    def callback(self, msg):
        pass


    def spin(self):
        print "WaterMonitor listening"
        while not rospy.is_shutdown():
            msg = Data()
            msg.property = "water_level"
            msg.timestamp = rospy.Time.now()
            msg.value = self.water_level
            self.pub.publish(msg)
            print "published water level"
            time.sleep(PUB_DELAY)


if __name__ == "__main__":
    m = WaterMonitor()
    m.spin()

