#!/usr/bin/env python

import rospy
from xhab_rogr.msg import *
import rogr_topics

class ManualController(object):
    def __init__(self):
        print "ManualController init"
        rospy.init_node("ManualController")
        pubtopic = "/tasks/rogr/drive"
        self.pubs = rogr_topics.make_task_publishers("/tasks/rogr/")

    def spin(self):
        while not rospy.is_shutdown():
            msg = None
            topic = None
            cmd = raw_input("cmd> ")
            if cmd == "water pump on":
                msg = WaterPumpTask()
                msg.pump_on = True
                msg.timestamp = rospy.Time.now()
                topic = "waterpump"
            elif cmd == "water pump off":
                msg = WaterPumpTask()
                msg.pump_on = False
                topic = "waterpump"
                msg.timestamp = rospy.Time.now()
            if cmd == "nutrient pump on":
                msg = NutrientPumpTask()
                msg.pump_on = True
                msg.timestamp = rospy.Time.now()
                topic = "nutrientpump"
            elif cmd == "nutrient pump off":
                msg = NutrientPumpTask()
                msg.pump_on = False
                msg.timestamp = rospy.Time.now()
                topic = "nutrientpump"
            elif cmd == "arm camera on":
                msg = ArmCameraTask()
                msg.camera_on = True
                msg.timestamp = rospy.Time.now()
                topic = "armcamera"
            elif cmd == "arm camera off":
                msg = ArmCameraTask()
                msg.camera_on = False
                msg.timestamp = rospy.Time.now()
                topic = "armcamera"
            elif cmd == "lift drive camera on":
                msg = LiftDriveCameraTask()
                msg.camera_on = True
                msg.timestamp = rospy.Time.now()
                topic = "liftdrivecamera"
            elif cmd == "lift drive camera off":
                msg = LiftDriveCameraTask()
                msg.camera_on = False
                msg.timestamp = rospy.Time.now()
                topic = "liftdrivecamera"
            else:
                print "unknown command"
                continue

            self.pubs[topic].publish(msg)
            print "send cmd"


if __name__ == "__main__":
    m = ManualController()
    m.spin()




