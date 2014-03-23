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
force_adc1 = cast(addr1, INTP1)

MAX_ADC = 1023
RESISTANCE = 27000 ##27kom
MAX_VOLT = 5
ADC_PIN = 4#0~7

class ForceSensor(object):
	def __init__(self):
		print "Force Sensor initializing..."
		rospy.init_node("Force_Sensor")
		subtopic = "force_task"
		pubtopic = "force"
		self.pub = rospy.Publisher(pubtopic, String)
		self.sub = rospy.Subscriber(subtopic, String, self.callback)
	def callback(self, msg):
		print "force measuring..."
		helper.sub_adc_config(dev_id, 0x8040)#enable ADC with VCC ref
		helper.sub_adc_single(dev_id, force_adc1, ADC_PIN)
		##calibration
		real_force = ((float)(RESISTANCE*force_adc1[0])/(1-(force_adc1[0]/MAX_ADC)))

		pubmsg = String()
		pubmsg.data = str(force_adc1[0])
		self.pub.publish(pubmsg)
		print force_adc1[0]
		print real_force
		print "force published"

	def spin(self):
		print "Force Sensor Listening"
		rospy.spin()

if __name__ == "__main__":
	try:
		p = ForceSensor()
		p.spin()
	except rospy.ROSInterruptException:
		pass#pass
		

