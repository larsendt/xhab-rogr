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

# triggers don't initialize right
INIT_LT = True
INIT_RT = True

def get_all():
    global INIT_LT, INIT_RT
    out = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    # these two don't initialize right

    out[BTN_LT] = -1
    out[BTN_RT] = -1
    it = 0
    pygame.event.pump()

    threshold = 0.001

    for i in range(0, j.get_numaxes()):
        out[it] = j.get_axis(i)
        # triggers start out at 0, but their base position is actually -1,
        # not sure why this is happening, but it's fixed
        if INIT_LT and it == BTN_LT:
            if out[it] == 0:
                out[it] = -1
            else:
                INIT_LT = False

        if INIT_RT and it == BTN_RT:
            if out[it] == 0:
                out[it] = -1
            else:
                INIT_RT = False
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
    global INIT_LT, INIT_RT
    pygame.event.pump()
    if item < j.get_numaxes():
        btn = j.get_axis(item)
        if INIT_LT and item == BTN_LT:
            if btn == 0:
                btn = -1
            else:
                INIT_LT = False
        if INIT_RT and item == BTN_RT:
            if btn == 0:
                btn = -1
            else:
                INIT_RT = False
        return btn
    elif item < (j.get_numaxes() + j.get_numbuttons()):
        return j.get_button(item - j.get_numaxes())
    elif item < (j.get_numaxes() + j.get_numbuttons() + j.get_numhats() + 1):
        hat = item - (j.get_numaxes() + j.get_numbuttons())
        if hat == 0:
            return j.get_hat(hat/2)[0]
        else:
            return j.get_hat(hat/2)[1]
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
