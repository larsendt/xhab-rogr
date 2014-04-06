#!/usr/bin/env python

import rospy
import time
from xhab_rogr.msg import *

PUB_DELAY = 15

class NutrientMonitor(object):
    def __init__(self):
        "NutrientMonitor init"
        rospy.init_node("NutrientMonitor")
        subtopic = "/tasks/rogr/nutrienttank"
        pubtopic = "/data/rogr/nutrienttank"
        self.sub = rospy.Subscriber(subtopic, NutrientTankTask, self.callback)
        self.pub = rospy.Publisher(pubtopic, Data)
        self.nutrient_level = 0

    def callback(self, msg):
        pass


    def spin(self):
        print "NutrientMonitor listening"
        while not rospy.is_shutdown():
            msg = Data()
            msg.property = "nutrient_level"
            msg.timestamp = rospy.Time.now()
            msg.value = self.nutrient_level
            self.pub.publish(msg)
            print "published nutrient level"
            time.sleep(PUB_DELAY)


if __name__ == "__main__":
    m = NutrientMonitor()
    m.spin()

