#!/usr/bin/env python

import rospy
import gamepad
import time
from xhab_rogr.msg import *

class GamepadControl(object):
    def __init__(self):
        print "GamepadControl init"
        rospy.init_node("GamepadControl")
        pubtopic = "/tasks/rogr/drive"
        self.pub = rospy.Publisher(pubtopic, DrivingTask)

    def spin(self):
        while not rospy.is_shutdown():
            msg = DrivingTask()
            x_move = gamepad.get_one(gamepad.LS_XAXIS)
            y_move = gamepad.get_one(gamepad.LS_YAXIS)
            rot = gamepad.get_one(gamepad.RS_XAXIS)

            threshold = 0.05
            if x_move < threshold and x_move > -threshold:
                x_move = 0
            if y_move < threshold and y_move > -threshold:
                y_move = 0
            if rot < threshold and rot > -threshold:
                rot = 0

            print "x:%.03f, y:%.03f, rot:%.03f" % (x_move, y_move, rot)

            msg.trans_x = x_move
            msg.trans_y = y_move
            msg.rot = rot
            self.pub.publish(msg)
            time.sleep(0.05)


if __name__ == "__main__":
    m = GamepadControl()
    m.spin()




