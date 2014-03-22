#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def battery_talker():
	pub = rospy.Publisher("battery_task", String)
	rospy.init_node("battery_talker")
	while not rospy.is_shutdown():
		try:	
			value = raw_input("0-do nothing; 1-get batttery info> ")
			if value != "0" and value != "1":
				print "bad value '%s'" % value
				raise ValueError("Input must be 0 or 1.")
			rospy.loginfo(value)
			pub.publish(String(value))
			rospy.sleep(10.0)
			print "input command", value
		except ValueError:
			print "input 0 or 1"

if __name__ == "__main__":
	try:
		battery_talker()
	except rospy.ROSInterruptException:
		pass
