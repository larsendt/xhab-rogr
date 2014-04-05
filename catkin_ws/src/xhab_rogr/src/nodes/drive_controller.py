#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *

MAX_QUEUE = 25

class DriveController(object):
    def __init__(self):
        print "DriveController init"
        rospy.init_node("DriveController")
        subtopic = "/tasks/rogr/drive"
        self.sub = rospy.Subscriber(subtopic, DrivingTask, self.callback)
        self.drive_queue = []

    def wheel_multipliers(self, speed, angle, rot_speed):
        v1 = (speed * math.sin(angle + (math.pi / 4))) + rot_speed
        v2 = (speed * math.cos(angle + (math.pi / 4))) - rot_speed
        v3 = (speed * math.cos(angle + (math.pi / 4))) + rot_speed
        v4 = (speed * math.sin(angle + (math.pi / 4))) - rot_speed
        return v1, v2, v3, v4

    def rotate(self, rotate_speed):
        return self.wheel_multipliers(0.0, 0.0, rotate_speed)

    def translate(self, angle):
        return self.wheel_multipliers(0.1, angle, 0.0)

    def stop(self):
        return (0, 0, 0, 0)

    def get_drive_cmd(self):
        if len(self.drive_queue) > 0:
            return self.drive_queue.pop()
        else:
            return None

    def add_drive_cmd(self, cmd):
        if len(self.drive_queue) < MAX_QUEUE:
            self.drive_queue.insert(0, cmd)
            print "drive queue len is:", len(self.drive_queue)
        else:
            print "drive queue is full"

    def drive(self, cmd):
        if cmd is None:
            self.stop()
            return

        try:
            print "Drive:", cmd
            time.sleep(0.2)
        finally:
            self.stop()

    def callback(self, msg):
        print "got msg"
        if msg.trans_y > 0:
            print "forward"
            cmd = self.translate(0)
        elif msg.trans_x < 0:
            print "backward"
            cmd = self.translate(math.pi)
        elif msg.trans_x > 0:
            print "right"
            cmd = self.translate(3*math.pi/2)
        elif msg.trans_x < 0:
            print "left"
            cmd = self.translate(math.pi/2)
        elif msg.rot > 0:
            print "counter clockwise"
            cmd = self.rotate(0.1)
        elif msg.rot < 0:
            print "clockwise"
            cmd = self.rotate(-0.1)
        else:
            cmd = self.stop()

        self.add_drive_cmd(cmd)

    def spin(self):
        print "DriveController listening"
        try:
            while not rospy.is_shutdown():
                cmd = self.get_drive_cmd()
                self.drive(cmd)
        finally:
            print "DriveController stop"
            self.stop()


if __name__ == "__main__":
    try:
        c = DriveController()
        c.spin()
    except rospy.ROSInterruptException:
        pass



