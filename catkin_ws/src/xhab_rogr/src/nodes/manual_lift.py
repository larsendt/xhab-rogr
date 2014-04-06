#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *

class ManualLift(object):
    def __init__(self):
        print "ManualLift init"
        rospy.init_node("ManualLift")
        pubtopic = "/tasks/rogr/lift"
        self.pub = rospy.Publisher(pubtopic, LiftingTask)

    def spin(self):
        while not rospy.is_shutdown():
            msg = LiftingTask()
            cmd = raw_input("uds> ")
            if cmd == "u":
                msg.lift = 1
            elif cmd == "d":
                msg.lift= -1
            elif cmd == "s":
                msg.lift = 0
            else:
                print "nope"
                continue

            self.pub.publish(msg)
            print "send cmd"


if __name__ == "__main__":
    m = ManualLift()
    m.spin()




