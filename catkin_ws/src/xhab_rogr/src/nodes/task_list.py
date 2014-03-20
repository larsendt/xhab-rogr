#!/usr/bin/env python
import rospy
import time
import datetime
from xhab_rogr.msg import *
import rogr_topics


_last_scheduled = {}
_frequency = {"battery":20, "armcamera":5}
def should_schedule(name, curtime):
    if name not in _frequency:
        return False

    if name in _last_scheduled:
        if int(curtime) - _last_scheduled[name] > _frequency[name]:
            _last_scheduled[name] = curtime
            return True
        else:
            return False
    else:
        _last_scheduled[name] = curtime
        return True

def armcamera_msg():
    msg = ArmCameraTask()
    msg.timestamp = rospy.Time.now()
    return msg

def battery_msg():
    msg = BatteryTask()
    msg.timestamp = rospy.Time.now()
    return msg

MESSAGE_MAP = {"armcamera":armcamera_msg, "battery":battery_msg}

class TaskList:
    def __init__(self):
        print "TaskList init"
        pub_topic = "/tasks/" + "rogr"
        self.publishers = rogr_topics.make_task_publishers(pub_topic)
        rospy.init_node("TaskList")


    def maybe_broadcast_task(self):
        now = int(time.time())
        for topic in rogr_topics.TOPICS:
            if should_schedule(topic, now):
                msg = MESSAGE_MAP[topic]()
                pub = self.publishers[topic]
                pub.publish(msg)
                print "published", topic


    def spin(self):
        print "TaskList listening"
        while not rospy.is_shutdown():
            self.maybe_broadcast_task()
            time.sleep(1)

        print "rospy shut down!"
                

if __name__ == "__main__":
    t = TaskList()
    try:
        t.spin()
    except rospy.ROSInterruptException:
        pass
    finally:
        print "cleanup!"
        t.cleanup() 


