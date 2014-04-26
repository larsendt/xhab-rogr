#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *
import time

rospy.init_node("ManualArm")
pub = rospy.Publisher("/tasks/rogr/arm", ArmTask)
s1 = 1
s2 = 1
e1 = 1
e2 = 1
w = 1
ef = 1

while True:
    try:
        s2 = int(raw_input("shoulder 2 [1-4]> "))
    except:
        pass

    try:
        e1 = int(raw_input("elbow 1 [0-5]> "))
    except:
        pass

    try:
        e2 = int(raw_input("elbow 2 [0-5]> "))
    except:
        pass

    try:
        w = int(raw_input("wrist [0-5]> "))
    except:
        pass

    try:
        ef = int(raw_input("effector [0-5]> "))
    except:
        pass

    print "sending commands..."

    msg = ArmTask()
    msg.shoulder1 = s1
    msg.shoulder2 = s2
    msg.elbow1 = e1
    msg.elbow2 = e2
    msg.wrist = w
    msg.end_effector = ef
    pub.publish(msg)
    time.sleep(0.5)
