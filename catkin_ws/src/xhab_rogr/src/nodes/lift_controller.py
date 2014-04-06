#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *

MAX_QUEUE = 25

class LiftController(object):
    def __init__(self):
        print "LiftController init"
        rospy.init_node("LiftController")
        subtopic = "/tasks/rogr/lift"
        self.sub = rospy.Subscriber(subtopic, LiftingTask, self.callback)
        self.lift_queue = []

    def get_lift_cmd(self):
        if len(self.lift_queue) > 0:
            return self.lift_queue.pop()
        else:
            return None

    def add_lift_cmd(self, cmd):
        if len(self.lift_queue) < MAX_QUEUE:
            self.lift_queue.insert(0, cmd)
            print "lift queue len is:", len(self.lift_queue)
        else:
            print "lift queue is full"

    def stop(self):
        pass

    def lift(self, cmd):
        if cmd is None:
            self.stop()
            time.sleep(0.2)
            return

        try:
            print "Lift:", cmd
            time.sleep(0.2)
        finally:
            self.stop()

    def callback(self, msg):
        print "got msg"
        if msg.lift > 0:
            print "lift up"
            cmd = 0.1
        elif msg.lift < 0:
            print "lift down"
            cmd = -0.1
        else:
            print "lift stop"
            cmd = 0.0

        self.add_lift_cmd(cmd)

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



