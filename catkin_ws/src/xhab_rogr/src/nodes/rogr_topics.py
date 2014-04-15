#!/usr/bin/env python

import sys
import rospy
import roslib
roslib.load_manifest('xhab_rogr')
from xhab_rogr.msg import *


TASK_MESSAGES = [ArmCameraTask, ArmTask, BatteryTask, Camera1Task, Camera2Task, CameraTurretTask, DistanceTask, LiftDriverTask, 
		NutrientPumpTask, NutrientTankTask, NutrientValveTask, PressureTask, WaterPumpTask, WaterTankTask, WaterValveTask, 
		WheelDriverTask]

DATA_MESSAGES = [Data, CameraData]

TOPICS = ["armcamera", "arm", "battery", "camera1", "camera2", "distance", "liftdriver", "nutrientpump", "nutrienttank", "nutrientvalve", 
         "pressure", "waterpump", "watertank", "watervalve", "wheeldriver", "cameraturret"]  

PROPERTIES = ["battery_level", "charging_status", "battery_full", "distance", "lift_speed", "nutrient_level", "pressure", "water_level", 
             "water_pump_on", "nutrient_pump_on", "shoulder1_angle", "shoulder2_angle", "elbow1_angle", "elbow2_angle", "wrist_angle", 
             "endeffector_angle", "camera1_status", "camera2_status", "arm_camera_status"] 

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
