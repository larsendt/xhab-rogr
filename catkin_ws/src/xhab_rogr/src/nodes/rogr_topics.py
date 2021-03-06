#!/usr/bin/env python

import sys
import rospy
import roslib
roslib.load_manifest('xhab_rogr')
from xhab_rogr.msg import *


TASK_MESSAGES = [ArmTask, BatteryTask, CameraTurretTask, DistanceTask, LiftDriverTask, NutrientPumpTask, NutrientTankTask,   
		PressureTask, WaterPumpTask, WaterTankTask, WaterValveTask, NutrientValveTask, WheelDriverTask]
		
DATA_MESSAGES = [Data]

TOPICS = ["arm", "battery", "distance", "liftdriver", "nutrientpump", "nutrienttank", "nutrientvalve", 
         "pressure", "waterpump", "watertank", "watervalve", "wheeldriver", "cameraturret"]  

PROPERTIES = ["battery_level", "charging_status", "battery_full", "distance", "lift_speed", "nutrient_level", "pressure", "water_level", 
             "water_pump_on", "nutrient_pump_on", "shoulder1_angle", "shoulder2_angle", "elbow1_angle", "elbow2_angle", "wrist_angle", 
             "endeffector_angle", "pan", "tilt"] 

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
