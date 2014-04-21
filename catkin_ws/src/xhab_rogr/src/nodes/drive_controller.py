#!/usr/bin/env python

import rospy
import math
import time
from xhab_rogr.msg import *
import motor_controller as mc
import wheelmotorConfig as wmc

MAX_QUEUE = 25
SERIALS = [wmc.FRONT_LEFT, wmc.FRONT_RIGHT, wmc.BACK_LEFT, wmc.BACK_RIGHT]

class DriveController(object):
    def __init__(self):
        print "DriveController init"
        rospy.init_node("DriveController")
        subtopic = "/tasks/rogr/drive"
        self.sub = rospy.Subscriber(subtopic, DrivingTask, self.callback)
        self.drive_queue = []

        self.controllers = []
        for sn in SERIALS:
            c = mc.MotorController(10000, 15000)
            c.attach()
            self.controllers.append((sn, c))

    def wheel_multipliers(self, speed, angle, rot_speed):
        v1 = ((speed * math.sin(angle + (math.pi / 4))) + rot_speed)
        v2 = -((speed * math.cos(angle + (math.pi / 4))) - rot_speed)
        v3 = -((speed * math.cos(angle + (math.pi / 4))) + rot_speed)
        v4 = ((speed * math.sin(angle + (math.pi / 4))) - rot_speed)
        return v1, v2, v3, v4

    def rotate(self, rotate_speed):
        return self.wheel_multipliers(0.0, 0.0, rotate_speed)

    def translate(self, angle, speed):
        return self.wheel_multipliers(speed, angle, 0.0)

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
            #print "drive queue len is:", len(self.drive_queue)
        else:
            pass
            #print "drive queue is full"

    def drive(self, cmd):
        if cmd is None:
            self.stop()
            return

        try:
            print "Drive:", map(lambda x: "%.4f" % x, cmd)
            for i, (sn, c) in enumerate(self.controllers):
                c.drive(cmd[i], 50000)
        finally:
            self.stop()

    def callback(self, msg):
        xaxis = self.translate(math.pi/2, -msg.rot)
        yaxis = self.translate(0, msg.trans_y)
        rot = self.rotate(msg.trans_x)

        mults = zip(xaxis, yaxis, rot)
        avgs = map(lambda x: float(sum(x))/len(x), mults)
        self.add_drive_cmd(avgs)

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



