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
        pubtopic = "/tasks/rogr/arm"
        self.arm_pub = rospy.Publisher(pubtopic, ArmTask)

    def spin(self):
        shoulder = 180
        elbow1 = 180
        elbow2 = 180
        wrist = 180
        while not rospy.is_shutdown():
            drive_msg = DrivingTask()
            lift_msg = LiftingTask()
            arm_msg = ArmTask()

            x_move = gamepad.get_one(gamepad.LS_XAXIS)
            y_move = gamepad.get_one(gamepad.LS_YAXIS)
            rot = gamepad.get_one(gamepad.RS_XAXIS)
            lift_up = gamepad.get_one(gamepad.BTN_LT)
            lift_down = gamepad.get_one(gamepad.BTN_RT)
            shoulder_mode = gamepad.get_one(gamepad.BTN_A)
            elbow1_mode = gamepad.get_one(gamepad.BTN_X)
            elbow2_mode = gamepad.get_one(gamepad.BTN_Y)
            wrist_mode = gamepad.get_one(gamepad.BTN_B)
            arm_neg_move = gamepad.get_one(gamepad.BTN_RB)
            arm_pos_move = gamepad.get_one(gamepad.BTN_LB)

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


            if arm_neg_move:
                arm_mv_amt = -5
            elif arm_pos_move:
                arm_mv_amt = 5
            else:
                arm_mv_amt = 0

            clamp = lambda (x,_min,_max): min(_max, max(_min, x))

            if arm_mv_amt != 0:
                if shoulder_mode:
                    shoulder += arm_mv_amt
                    shoulder = clamp((shoulder, 90, 220))
                    print "SHOULDER", shoulder

                if elbow1_mode:
                    elbow1 += arm_mv_amt
                    elbow1 = clamp((elbow1, 45, 300))
                    print "ELBOW 1", elbow1

                if elbow2_mode:
                    elbow2 += arm_mv_amt
                    elbow2 = clamp((elbow2, 75, 280))
                    print "ELBOW 2", elbow2

                if wrist_mode:
                    wrist += arm_mv_amt
                    wrist = clamp((wrist, -360, 360))
                    print "WRIST", wrist


            print "Drive: x:%.03f, y:%.03f, rot:%.03f" % (x_move, y_move, rot)
            print "Lift: %.03f" % lift

            drive_msg.trans_x = x_move
            drive_msg.trans_y = y_move
            drive_msg.rot = rot
            self.drive_pub.publish(drive_msg)

            lift_msg.lift = lift
            self.lift_pub.publish(lift_msg)

            arm_msg.shoulder1_angle = shoulder
            arm_msg.shoulder2_angle = shoulder
            arm_msg.elbow1_angle = elbow1
            arm_msg.elbow2_angle = elbow2
            arm_msg.wrist_angle = wrist
            arm_msg.endeffector_angle = 0
            self.arm_pub.publish(arm_msg)

            time.sleep(0.05)


if __name__ == "__main__":
    m = GamepadControl()
    m.spin()




