#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *
import motor_controller as mc

MAX_QUEUE = 25
SERIAL = 344945
LOWER_BOUND = 0
UPPER_BOUND = 1000

class LiftController(object):
    def __init__(self):
        print "LiftController init"
        rospy.init_node("LiftController")
        subtopic = "/tasks/rogr/lift"
        self.sub = rospy.Subscriber(subtopic, LiftingTask, self.callback)
        self.lift_queue = []
        self.controller = mc.MotorController(5000, 15000, SERIAL)

    def get_lift_cmd(self):
        if len(self.lift_queue) > 0:
            return self.lift_queue.pop()
        else:
            return None

    def add_lift_cmd(self, cmd):
        if len(self.lift_queue) < MAX_QUEUE:
            self.lift_queue.insert(0, cmd)

    def stop(self):
        self.controller.move_position(0, UPPER_BOUND, LOWER_BOUND)
        pass

    def lift(self, cmd):
        if cmd is None:
            self.stop()
            return

        try:
            print "Lift:", cmd
            self.controller.move_position(int(100 * cmd), UPPER_BOUND, LOWER_BOUND)
        finally:
            self.stop()

    def callback(self, msg):
        print type(msg.lift)
        print msg.lift
        self.add_lift_cmd(msg.lift)

    def spin(self):
        print "LiftController listening"
        try:
            while not rospy.is_shutdown():
                cmd = self.get_lift_cmd()
                self.lift(cmd)
        finally:
            print "LiftController stop"
            self.stop()


if __name__ == "__main__":
    try:
        c = LiftController()
        c.spin()
    except rospy.ROSInterruptException:
        pass



