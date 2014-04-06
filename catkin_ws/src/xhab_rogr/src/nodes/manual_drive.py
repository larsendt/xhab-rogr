#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *

class ManualDrive(object):
    def __init__(self):
        print "ManualDrive init"
        rospy.init_node("ManualDrive")
        pubtopic = "/tasks/rogr/drive"
        self.pub = rospy.Publisher(pubtopic, DrivingTask)

    def spin(self):
        while not rospy.is_shutdown():
            msg = DrivingTask()
            msg.trans_x = 0
            msg.trans_y = 0
            msg.rot = 0
            cmd = raw_input("wasdqe> ")
            if cmd == "w":
                msg.trans_y = 1
            elif cmd == "a":
                msg.trans_x = -1
            elif cmd == "s":
                msg.trans_y = -1
            elif cmd == "d":
                msg.trans_x = 1
            elif cmd == "q":
                msg.rot = 1
            elif cmd == "e":
                msg.rot = -1
            else:
                print "nope"
                continue

            self.pub.publish(msg)
            print "send cmd"


if __name__ == "__main__":
    m = ManualDrive()
    m.spin()




