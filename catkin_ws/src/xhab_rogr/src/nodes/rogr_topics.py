#!/usr/bin/env python

import sys
import rospy
import roslib
roslib.load_manifest('xhab_rogr')
from xhab_rogr.msg import *


TASK_MESSAGES = [ArmCameraTask, ArmTask, BatteryTask, DrivingTask, LiftDriveCameraTask, LiftingTask, NutrientPumpTask, NutrientTankTask, 
                WaterPumpTask, WaterTankTask]

DATA_MESSAGES = [Data, CameraData]

TOPICS = ["armcamera", "arm", "battery", "drivingmechanism", "liftdrivecamera", "liftingmechanism", "nutrientpump", "nutrienttank","waterpump",
         "watertank"]  

PROPERTIES = ["battery_charging", "battery_level", "battery_full", "water_level", "nutrient_level"] 

def make_task_publishers(base_topic):
    tt = zip(TOPICS, TASK_MESSAGES)
    pubs = {}
    for name, msg in tt:
        pubs[name] = rospy.Publisher(base_topic + "/" + name, msg)
    return pubs

def make_task_subscribers(base_topic, callback):
    tt = zip(TOPICS, TASK_MESSAGES)
    subs = {}
    for name, msg in tt:
        subs [name] = rospy.Subscriber(base_topic + "/" + name, msg, callback)
    return subs 

def make_data_subscribers(base_topic, callback):
    tt = map(lambda x: (x, Data), TOPICS)
    subs = {}
    for name, msg in tt:
        subs [name] = rospy.Subscriber(base_topic + "/" + name, msg, callback)
    return subs 
