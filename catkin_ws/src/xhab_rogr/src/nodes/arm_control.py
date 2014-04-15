#!/usr/bin/env python

import sys
import rospy
from xhab_rogr.msg import *
import time
import random
from lib_robotis import *
from findUSBDev import *

PUB_DELAY = 15

shoulder1_angle = 0
shoulder2_angle = 0
elbow1_angle = 0
elbow2_agle = 0
wrist_angle = 0
endeffector_angle = 0

class ArmControl(object):
    def __init__(self):
        print "ArmControl init"
        rospy.init_node("ArmControl")
        subtopic = "/tasks" + "/rogr" + "/arm"
        pubtopic = "/data" + "/rogr" + "/arm"
        self.pub = rospy.Publisher(pubtopic, Data)
        self.sub = rospy.Subscriber(subtopic, ArmTask, self.callback)       
	self.callback(ArmTask())
	
	
    def callback(self, msg):
        print "callback"
        USBPaths = findUSBDev()
	
	USB0 = USB2Dynamixel_Device(USBPaths[0])
	USB1 = USB2Dynamixel_Device(USBPaths[1])
        
	shoulder1 = Robotis_Servo(USB0,1)
	shoulder2 = Robotis_Servo(USB0,2)
	elbow1 = Robotis_Servo(USB1,3)
	elbow2 = Robotis_Servo(USB1,4)
	wrist = Robotis_Servo(USB1,5)
	endeffector = Robotis_Servo(USB1,6)
        
       	shoulder1.move_angle(shoulder1_angle)
        shoulder2.move_angle(shoulder2_angle)
        elbow1.move_angle(elbow1_angle)
	elbow2.move_angle(elbow2_angle)
	wrist.move_angle(wrist_angle)
	endeffector.move_angle(endeffector_angle)
	

    def spin(self):
        while not rospy.is_shutdown():
            pubmsg = Data()
	    pubmsg.property = "shoulder1 angle"
            pubmsg.value = shoulder1_angle
	    pubmsg.property = "shoulder2 angle"
            pubmsg.value = shoulder2_angle
	    pubmsg.property = "elbow1 angle"
            pubmsg.value = elbow1_angle
            pubmsg.property = "elbow2 angle"
            pubmsg.value = elbow2_angle
	    pubmsg.property = "wrist angle"
            pubmsg.value = wrist_angle
	    pubmsg.property = "endeffector angle"
            pubmsg.value = endeffector_angle
	    pubmsg.timestamp = rospy.Time.now() 
            self.pub.publish(pubmsg)
            time.sleep(PUB_DELAY)


if __name__ == "__main__":
    try:
        p = ArmControl()
	p.spin()
        
    except rospy.ROSInterruptException:
        pass
