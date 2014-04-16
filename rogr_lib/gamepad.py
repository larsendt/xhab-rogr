#!/usr/bin/env python

import pygame.joystick
import sys
import os

pygame.init()
j = pygame.joystick.Joystick(0)
j.init()
print 'Initialized Joystick : %s' % j.get_name()

LS_XAXIS = 0
LS_YAXIS = 1
BTN_LT = 2
RS_XAXIS = 3
RS_YAXIS = 4
BTN_RT = 5
BTN_A = 6
BTN_B = 7
BTN_X = 8
BTN_Y = 9
BTN_LB = 10
BTN_RB = 11
BTN_BACK = 12
BTN_START = 13
BTN_UNKNOWN = 14
BTN_LS = 15
BTN_RS = 16
DPAD_XAXIS = 17
DPAD_YAXIS = 18

NAMES = ["LS_XAXIS",
         "LS_YAXIS",
         "BTN_LT",
         "RS_XAXIS",
         "RS_YAXIS",
         "BTN_RT",
         "BTN_A",
         "BTN_B",
         "BTN_X",
         "BTN_Y",
         "BTN_LB",
         "BTN_RB",
         "BTN_BACK",
         "BTN_START",
         "BTN_UNKNOWN",
         "BTN_LS",
         "BTN_RS",
         "DPAD_XAXIS",
         "DPAD_YAXIS"]

def get_all():
    out = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    # these two don't initialize right
    out[BTN_LT] = -1
    out[BTN_RT] = -1
    it = 0
    pygame.event.pump()

    threshold = 0.001

    for i in range(0, j.get_numaxes()):
        out[it] = j.get_axis(i)
        if out[it] < threshold and out[it] > -threshold:
            out[it] = 0
        it+=1

    for i in range(0, j.get_numbuttons()):
        out[it] = j.get_button(i)
        if out[it] < threshold and out[it] > -threshold:
            out[it] = 0
        it+=1

    for i in range(0,j.get_numhats()):
        out[it] = j.get_hat(i)[0]
        it+=1
        out[it] = j.get_hat(i)[1]
        it+=1

    return out

def get_one(item):
    pygame.event.pump()
    if item < j.get_numaxes():
        return j.get_axis(item)
    elif item < (j.get_numaxes() + j.get_numbuttons()):
        return j.get_button(item - j.get_numaxes())
    elif item < (j.get_numaxes() + j.get_numbuttons() + j.get_numhats()):
        return j.get_hat(item - (j.get_numaxes() + j.get_numbuttons()))
    else:
        print "Unknown item:", item
        return None

def test_all():
    lastread = []
    while True:
        newread = get_all()
        if newread != lastread:
            for i,(x,y) in enumerate(zip(lastread, newread)):
                if x != y:
                    print i, "::", y,
            lastread = newread
            print ""

def test_one():
    lastread = 0
    while True:
        newread = get_one(BTN_A)
        if newread != lastread:
            print newread
            lastread = newread

if __name__ == "__main__":
    test_all()
