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
status1 = cast(addr1, INTP1)

INTP2 = POINTER(c_int)
num2 = c_int(0)
addr2 = addressof(num2)
status2 = cast(addr2, INTP2)

INTP3 = POINTER(c_int)
num3 = c_int(0)
addr3 = addressof(num3)
battery_level = cast(addr3, INTP3)

class BatterySensor(object):
	def __init__(self):
		print "Battery Sensor initializing..."
		rospy.init_node("Battery_Sensor")
		subtopic = "battery_task"
		pubtopic = "battery_status"
		self.pub = rospy.Publisher(pubtopic, String)
		self.sub = rospy.Subscriber(subtopic, String, self.callback)
	def callback(self, msg):
		print "battery status checking..."
		helper.sub_adc_config(dev_id, 0x8040)#enable ADC with VCC ref
		helper.sub_adc_single(dev_id, status1, 0)
		helper.sub_adc_single(dev_id, status2, 1)
		helper.sub_adc_single(dev_id, battery_level, 2)
		if (status1[0] > 500) and (status2[0] < 100):#need adjust threshold
			bat_charge = "charging"#charging
		elif (status1[0] < 100) and (status2[0] > 500):
			bat_charge = "fully charged"
		else:
			bat_charge = "no battery detected"
		pubmsg = String()
		pubmsg.data = bat_charge
		self.pub.publish(pubmsg)

		pubmsg.data = String(battery_level[0])#need scaling
		self.pub.publish(pubmsg)
		print bat_charge
		print "battery level is:%s" % String(battery_level[0])
		print "battery status, level published"

	def spin(self):
		print "Battery Sensor Listening"
		rospy.spin()

if __name__ == "__main__":
	try:
		p = BatterySensor()
		p.spin()
	except rospy.ROSInterruptException:
		pass#pass
		
