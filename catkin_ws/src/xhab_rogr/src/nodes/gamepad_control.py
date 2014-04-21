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
        self.drive_pub = rospy.Publisher(pubtopic, DrivingTask)
        pubtopic = "/tasks/rogr/lift"
        self.lift_pub = rospy.Publisher(pubtopic, LiftingTask)

    def spin(self):
        lift_on = False
        while not rospy.is_shutdown():
            drive_msg = DrivingTask()
            lift_msg = LiftingTask()
            x_move = gamepad.get_one(gamepad.LS_XAXIS)
            y_move = gamepad.get_one(gamepad.LS_YAXIS)
            rot = gamepad.get_one(gamepad.RS_XAXIS)
            lift_up = gamepad.get_one(gamepad.BTN_LT)
            lift_down = gamepad.get_one(gamepad.BTN_RT)
            lift_toggle = gamepad.get_one(gamepad.BTN_A)

            threshold = 0.05
            if x_move < threshold and x_move > -threshold:
                x_move = 0
            if y_move < threshold and y_move > -threshold:
                y_move = 0
            if rot < threshold and rot > -threshold:
                rot = 0

            if lift_up > -1:
                lift = (lift_up + 1.0) / 2.0
            elif lift_down > -1:
                lift = -((lift_down + 1.0) / 2.0)
            else:
                lift = 0

            print "Drive: x:%.03f, y:%.03f, rot:%.03f" % (x_move, y_move, rot)
            print "Lift: %.03f" % lift

            drive_msg.trans_x = x_move
            drive_msg.trans_y = y_move
            drive_msg.rot = rot
            self.drive_pub.publish(drive_msg)

            lift_msg.lift = lift
            self.lift_pub.publish(lift_msg)

            time.sleep(0.05)


if __name__ == "__main__":
    m = GamepadControl()
    m.spin()




