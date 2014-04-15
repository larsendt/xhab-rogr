#!/usr/bin/env python

import sys
import rospy
from 	std_msgs.msg import String

from ctypes import *

helper = cdll.LoadLibrary("./libsub.so")
dev_id = helper.sub_open(0)

INTP1 = POINTER(c_int)
num1 = c_int(0)
addr1 = addressof(num1)
distance = cast(addr1, INTP1)

MAX_ADC = 1024
SCALE_NUM = 27 ##~27V*cm
MAX_VOLT = 5

class DistanceSensor(object):
	def __init__(self):
		print "Distance Sensor initializing..."
		rospy.init_node("DIstance_Sensor")
		subtopic = "distance_task"
		pubtopic = "distance"
		self.pub = rospy.Publisher(pubtopic, String)
		self.sub = rospy.Subscriber(subtopic, String, self.callback)
	def callback(self, msg):
		print "distance measuring..."
		helper.sub_adc_config(dev_id, 0x8040)#enable ADC with VCC ref
		helper.sub_adc_single(dev_id, distance, 0)
		##calibration
		real_distance = 27/((float)(distance[0])*MAX_VOLT/MAX_ADC)
		pubmsg = String()
		pubmsg.data = str(distance[0])
		self.pub.publish(pubmsg)
		print distance[0]
		print real_distance
		print "distance published"

	def spin(self):
		print "Distance Sensor Listening"
		rospy.spin()

if __name__ == "__main__":
	try:
		p = DistanceSensor()
		p.spin()
	except rospy.ROSInterruptException:
		pass#pass
		

