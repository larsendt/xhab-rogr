#!/usr/bin/env python

from ctypes import *
from ctypes.util import find_library
import os.path
import sys
import numpy
liblocation = find_library("sub")
if not liblocation:
    raise StandardError("failed to locate libsub library")
subpath = os.path.dirname(liblocation)
subfile = os.path.basename(liblocation)

#pointer to actual library file
sublib = numpy.ctypeslib.load_library(subfile,subpath)

#*_raw are python objects that points to corresponding c functions in the c library.
sub_open_raw = sublib.sub_open
sub_lcd_write_raw = sublib.sub_lcd_write
sub_close_raw = sublib.sub_close
sub_gpio_config_raw = sublib.sub_gpio_config
sub_gpio_read_raw = sublib.sub_gpio_read
sub_gpio_write_raw = sublib.sub_gpio_write
sub_fpwm_config_raw = sublib.sub_fpwm_config
sub_fpwm_set_raw = sublib.sub_fpwm_set
sub_pwm_config_raw = sublib.sub_pwm_config
sub_pwm_set_raw = sublib.sub_pwm_set
sub_adc_config_raw = sublib.sub_adc_config
sub_adc_single_raw = sublib.sub_adc_single
sub_adc_read_raw = sublib.sub_adc_read

#python function argument types
sub_open_raw.argtypes = [c_int]
sub_lcd_write_raw.argtypes = [c_int,c_char_p]
sub_close_raw.argtypes = [c_int]
sub_gpio_config_raw.argtypes = [c_int,c_int,POINTER(c_int),c_int]
sub_gpio_read_raw.argtypes = [c_int,POINTER(c_int)]
sub_gpio_write_raw.argtypes = [c_int,c_int,POINTER(c_int),c_int]
sub_fpwm_config_raw.argtypes = [c_int, c_double, c_int]
sub_fpwm_set_raw.argtypes = [c_int,c_int,c_double] 
sub_pwm_config_raw.argtypes = [c_int, c_int, c_int]
sub_pwm_set_raw.argtypes = [c_int,c_int,c_int] 
sub_adc_config_raw.argtypes = [c_int, c_int]
sub_adc_single_raw.argtypes = [c_int, POINTER(c_int), c_int]
sub_adc_read_raw.argtypes = [c_int, POINTER(c_int), POINTER(c_int), c_int]
#python function wrapper definitions
def sub_open(hndl):
    rt = c_int()
    rt = sub_open_raw(hndl)
    return(rt)
    
def sub_lcd_write(hndl, string):
    rt = c_int()
    rt = sub_lcd_write_raw(hndl,string)
    return(rt)

def sub_close(hndl):
    rt = c_int()
    rt = sub_close_raw(hndl,byref(rt))
    return(rt)

def sub_gpio_config(hndl,setv,mask):
    rt = c_int()
    config = c_int()
    rt = sub_gpio_config_raw(hndl,setv,byref(config),mask)
    return(rt,config)

def sub_gpio_read(hndl):
    rt = c_int()
    status = c_int()
    rt = sub_gpio_read_raw(hndl,byref(status))
    return(rt,status)

def sub_gpio_write(hndl,setv,mask):
    rt = c_int()
    status = c_int()
    rt = sub_gpio_write_raw(hndl,setv,byref(status),mask)
    return(rt,status)
    
def sub_fpwm_config(hndl,freq_hz,flags):
    rt = c_int()
    rt = sub_fpwm_config_raw(hndl,freq_hz,flags)
    return(rt)

def sub_fpwm_set(hndl,pwm_n,duty):
    rt = c_int()
    rt = sub_fpwm_set_raw(hndl,pwm_n,duty)
    return(rt)

def sub_pwm_config(hndl,res_us,limit):
    rt = c_int()
    rt = sub_pwm_config_raw(hndl,res_us,limit)
    return(rt)

def sub_pwm_set(hndl,pwm_n,duty):
    rt = c_int()
    rt = sub_pwm_set_raw(hndl,pwm_n,duty)
    return(rt)

def sub_adc_config(hndl, flags):
    rt = c_int()
    rt = sub_adc_config_raw(hndl,flags)
    return(rt)

def sub_adc_single(hndl,mux):
    rt = c_int()
    data = c_int()
    rt = sub_adc_single_raw(hndl,byref(data), mux)
    return(rt,data)


def sub_adc_read(hndl,mux):
    rt = c_int()
    reads = len(mux)
    array_type = c_int * reads
    data = c_int() * reads
    rt = sub_adc_read_raw(hndl,array_type(*data),array_type(*mux),reads)
    return (rt,data)
                          
