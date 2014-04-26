#!/usr/bin/env python

from ctypes import *
import sys
import math
from time import sleep
from Phidgets.PhidgetException import PhidgetErrorCodes, PhidgetException
from Phidgets.Events.Events import (AttachEventArgs, DetachEventArgs,
                                    ErrorEventArgs, InputChangeEventArgs,
                                    CurrentChangeEventArgs,
                                    StepperPositionChangeEventArgs,
                                    VelocityChangeEventArgs)
from Phidgets.Devices.Stepper import Stepper


class MotorController(object):
    def __init__(self, vel=5000, acc=5000, serial=-1):
        self.stepper = Stepper()
        self.current_position = 0
        self.base_velocity = vel
        self.acceleration = acc
        self.serial = serial

    def attach(self):
        try:
            print "Opening Phidget... (serial:", self.serial, ")"
            self.stepper.openPhidget(self.serial)
        except PhidgetException as e:
            print "Phidget Exception %i: %s" % (e.code, e.details)

        try:
            print "Waiting 5 seconds for attach..."
            self.stepper.waitForAttach(5000)
        except PhidgetException as e:
            print "Phidget Exception %i: %s" % (e.code, e.details)
            self.stepper.closePhidget()

        print "Setting limits..."
        self.current_position = self.stepper.getCurrentPosition(0)
        self.stepper.setCurrentPosition(0, self.current_position)
        self.stepper.setEngaged(0, True)
        self.stepper.setAcceleration(0, self.acceleration)
        self.stepper.setVelocityLimit(0, self.base_velocity)
        self.stepper.setCurrentLimit(0, 1.70)
        print "Done!"


    def drive(self, multiplier, steps):
        self.current_position = self.stepper.getCurrentPosition(0)

        if multiplier > 0:
            dv = int(steps * (abs(multiplier) ** 2))
            print "dv", dv
            self.current_position += dv
        elif multiplier < 0:
            dv = int(steps * (abs(multiplier) ** 2))
            print "dv", dv
            self.current_position -= dv
        else:
            print "dv", 0

        self.stepper.setTargetPosition(0, self.current_position)

    def set_position(self, position):
        self.current_position = position
        self.stepper.setTargetPosition(0, self.current_position)

    def move_position(self, pos_delta, upper_bound, lower_bound):
        self.current_position += pos_delta
        if self.current_position > upper_bound:
            self.current_position = upper_bound
        elif self.current_position < lower_bound:
            self.current_position = lower_bound

        self.stepper.setTargetPosition(0, self.current_position)


if __name__ == "__main__":
    c = MotorController(5000, 50000)
    c.attach()

    while True:
        inp = raw_input("fb> ")
        if inp == "f":
            c.drive(1.0, 10000)
        elif inp == "b":
            c.drive(-1.0, 10000)
        else:
            print "whoops!"
