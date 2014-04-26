#!/usr/bin/env python

import curses
import rospy
import time
from xhab_rogr.msg import *

rospy.init_node("KeyboardControl")
pub = rospy.Publisher("/tasks/rogr/drive", DrivingTask)

stdscr = curses.initscr()
curses.cbreak()
stdscr.keypad(1)
stdscr.nodelay(True)

stdscr.addstr(0, 0, "This is the ROGR keyboard interface!")
stdscr.addstr(1, 0, "Use WASDQE to drive")
stdscr.addstr(2, 0, "Hit ESC to quit")
stdscr.addstr(4, 0, "")
stdscr.refresh()

def run():
    key = ""
    while True:
        key = stdscr.getch()
        curses.flushinp()

        msg = DrivingTask()
        msg.trans_x = 0
        msg.trans_y = 0
        msg.rot = 0

        if key == ord("w"):
            msg.trans_y = 1
        elif key == ord("a"):
            msg.trans_x = -1
        elif key == ord("s"):
            msg.trans_y = -1
        elif key == ord("d"):
            msg.trans_x = 1
        elif key == ord("q"):
            msg.rot = 1
        elif key == ord("e"):
            msg.rot = -1

        pub.publish(msg)

        s = "Msg: x:%d y:%d r:%d    " % (msg.trans_x, msg.trans_y, msg.rot)

        stdscr.addstr(3, 0, s)
        stdscr.addstr(4, 0, "")

        stdscr.refresh()
        if key == 27: # ESC
            break

        time.sleep(0.01)

try:
    run()
finally:
    curses.endwin()
