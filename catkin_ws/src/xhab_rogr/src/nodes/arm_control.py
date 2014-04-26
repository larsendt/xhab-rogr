#!/usr/bin/env python

import sys
import rospy
from xhab_rogr.msg import *
import time
import random
from lib_robotis import *
from findUSBDev import *

PUB_DELAY = 15



class ArmControl(object):
    def __init__(self):
        print "ArmControl init"
        rospy.init_node("ArmControl")
        subtopic = "/tasks" + "/rogr" + "/arm"
        pubtopic = "/tasks" + "/rogr" + "/arm"
        self.sub = rospy.Subscriber(subtopic, Data, self.callback)

        USBPaths = findUSBDev()

        USB0 = USB2Dynamixel_Device(USBPaths[0])
        USB1 = USB2Dynamixel_Device(USBPaths[1])

        self.shoulder1 = Robotis_Servo(USB0,1)
        self.shoulder2 = Robotis_Servo(USB0,2)
        self.elbow1 = Robotis_Servo(USB1,3)
        self.elbow2 = Robotis_Servo(USB1,4)
        self.wrist = Robotis_Servo(USB1,5)
        self.endeffector = Robotis_Servo(USB1,6)


    def callback(self, msg):
        self.shoulder1.move_angle(math.radians(msg.shoulder1_angle), blocking = False)
        self.shoulder2.move_angle(math.radians(msg.shoulder2_angle), blocking = False)
        self.elbow1.move_angle(math.radians(msg.elbow1_angle), blocking = False)
        self.elbow2.move_angle(math.radians(msg.elbow2_angle), blocking = False)
        self.wrist.move_angle(math.radians(msg.wrist_angle), blocking = False)
        self.endeffector.move_angle(math.radians(msg.endeffector_angle), blocking = False)
        print "Received arm joint angles"


    def spin(self):
        while not rospy.is_shutdown():
            print "ArmController listening"
            rospy.spin()


if __name__ == "__main__":
    try:
        p = ArmControl()
        p.spin()

    except rospy.ROSInterruptException:
        pass
