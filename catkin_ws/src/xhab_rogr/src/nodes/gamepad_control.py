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
        last_x_move = None
        last_y_move = None
        last_rot = None
        while not rospy.is_shutdown():
            msg = DrivingTask()
            x_move = gamepad.get_one(gamepad.LS_XAXIS)
            y_move = gamepad.get_one(gamepad.LS_YAXIS)
            rot = gamepad.get_one(gamepad.RS_XAXIS)

            if (last_x_move, last_y_move, last_rot) != (x_move, y_move, rot):
                last_x_move, last_y_move, last_rot = x_move, y_move, rot
                print "x:%.03f, y:%.03f, rot:%.03f" % (x_move, y_move, rot)

            msg.trans_x = x_move
            msg.trans_y = y_move
            msg.rot = rot
            self.pub.publish(msg)
            time.sleep(0.05)
            print "send cmd"


if __name__ == "__main__":
    m = GamepadControl()
    m.spin()




