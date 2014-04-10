#!/usr/bin/env python

import subprocess as sp
import time
import sys
import os
import signal
import psutil
import daemon
import argparse
import traceback
from threading  import Thread
from Queue import Queue, Empty

HOME = "/home/dane/dev/xhab-rogr/"
SERVICE_DIR = os.path.join(HOME, "service_files/")

ROS_NODES = ["arm_camera_controller.py",
             "battery_sensor.py",
             "distance_sensor.py",
             "drive_controller.py",
             "lift_controller.py",
             "lift_drive_camera_controller.py",
             "nutrient_controller.py",
             "nutrient_monitor.py",
             "pressure_sensor.py",
             "water_controller.py",
             "water_monitor.py"]

CMDS = map(lambda x: "rosrun xhab_rogr " + x, ROS_NODES)
ROSCORE_PROC = None
ROSMASTER_IP = None

if not os.path.exists(SERVICE_DIR):
    os.makedirs(SERVICE_DIR)

class Service(object):
    def __init__(self, cmd, name):
        self.cmd = cmd.split(" ")
        self.cmdline = cmd
        self.name = name
        self.proc = None
        self.stdout_queue = None
        self.stderr_queue = None
        self.stdout_thread = None
        self.stderr_thread = None
        self.stdout = []
        self.stderr = []
        self.is_alive = False

        self.write_stdout("Initializing Service: " + name + "\n", "w")
        self.write_stderr("", "w")

    def run(self):
        self.proc = sp.Popen(self.cmd, stdout=sp.PIPE, stderr=sp.PIPE, close_fds=True)
        print "Launch: %s [pid=%d]" % (self.name, self.proc.pid)
        self.stdout_queue = Queue()
        self.stdout_thread = Thread(target=self.enqueue_output, args=(self.proc.stdout, self.stdout_queue))
        self.stdout_thread.daemon = True
        self.stdout_thread.start()
        self.stderr_queue = Queue()
        self.stderr_thread = Thread(target=self.enqueue_output, args=(self.proc.stderr, self.stderr_queue))
        self.stderr_thread.daemon = True
        self.stderr_thread.start()
        self.is_alive = True

    def kill(self):
        try:
            print "Kill: %s [pid=%d]" % (self.name, self.proc.pid)
            self.proc.kill()
            self.proc.wait()
        except:
            print "Service '%s' is already dead" % self.cmdline
        self.is_alive = False

    def enqueue_output(self, out, queue):
        for line in iter(out.readline, b''):
            queue.put(line)
        out.close()

    def write_stdout(self, text, mode="a"):
        with open(SERVICE_DIR + self.cmd[2] + ".stdout.txt", mode) as f:
            f.write(text)

    def write_stderr(self, text, mode="a"):
        with open(SERVICE_DIR + self.cmd[2] + ".stderr.txt", mode) as f:
            f.write(text)

    def update(self):
        try:
            while True:
                stdout = self.stdout_queue.get_nowait()
                self.stdout.append(stdout)
                self.write_stdout(stdout)
        except Empty:
            pass

        try:
            while True:
                stderr = self.stderr_queue.get_nowait()
                self.stderr.append(stderr)
                self.write_stderr(stderr)
        except Empty:
            pass

        ret = self.proc.poll()
        if ret != None and self.is_alive:
            print "Service '%s' exited with return code %d!" % (self.cmdline, ret)
            print ""
            print "==============================================="
            print "".join(self.stderr)
            print "==============================================="
            print ""
            self.stdout_thread.join()
            self.stderr_thread.join()
            self.is_alive = False
            print "Marked service as not alive"
            print "Attempting to restart service"
            self.run()
            print "Hopefully restarted service"

SERVICES = map(lambda (cmd, name): Service(cmd, name), zip(CMDS, ROS_NODES))

def start_roscore():
    for proc in psutil.process_iter():
        for item in proc.cmdline:
            if "rosmaster" in item or "roscore" in item:
                print "ROS Core is already running"
                return None
    proc = sp.Popen("roscore", close_fds=True, stdout=sp.PIPE, stderr=sp.PIPE)
    print "Starting ROS Core [pid=%d]" % proc.pid
    return proc


def stop_roscore(roscore_proc):
    if roscore_proc:
        print "Killing ROS Core [pid=%d]" % roscore_proc.pid
        roscore_proc.kill()
        roscore_proc.wait()
    else:
        for proc in psutil.process_iter():
            for item in proc.cmdline:
                if "roscore" in item or "rosmaster" in item:
                    print "Killing ROS Core [pid=%d]" % proc.pid
                    os.kill(proc.pid, signal.SIGKILL)



def check_already_running(interactive):
    otherproc = None
    for proc in psutil.process_iter():
        if "launch_rogr.py" in " ".join(proc.cmdline) and proc.name == "python":
            if proc.pid != os.getpid():
                otherproc = proc
                break

    if otherproc is None:
        return False

    print "Found another ROGR process: \"%s\" [pid=%d]" % (" ".join(proc.cmdline), proc.pid)
    if interactive:
        print "Type 'y' to shut down other process, 'n' to exit"
        inp = ""
        while inp != "y" and inp != "n":
            inp = raw_input("[y/n] ")
    else:
        inp = "y"

    if inp == "y":
        print "Terminating other process..."
        os.kill(proc.pid, signal.SIGINT)
        time.sleep(3)
    else:
        print "Exiting"
        sys.exit(0)

    return True


def terminate_services(type=None, value=None, traceback_obj=None):
    if traceback_obj is not None:
        print "exception!", "".join(traceback.format_tb(traceback_obj))

    map(lambda x: x.kill(), SERVICES)
    if ROSMASTER_IP is None:
        stop_roscore(ROSCORE_PROC)

sys.excepthook = terminate_services


def main(rosmaster_ip):
    if rosmaster_ip is None:
        # launch a local ros master
        roscore_proc = start_roscore()
        global ROSCORE_PROC
        ROSCORE_PROC = roscore_proc
    else:
        # use a remote ros master with the specified ip
        uri = "http://%s:11311" % rosmaster_ip
        print "ROS_MASTER_URI is:", uri
        os.putenv("ROS_MASTER_URI", uri)

    print "Launching %d services" % len(SERVICES)
    map(lambda x: x.run(), SERVICES)
    print "Monitoring services"
    try:
        while True:
            time.sleep(1)
            map(lambda x: x.update(), SERVICES)
    except KeyboardInterrupt:
        print "Terminating all services"
        terminate_services()
        print "Done"


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Launch ROGR")
    parser.add_argument("--no-interactive", help="Don't prompt the user for anything.", action="store_true")
    parser.add_argument("--remote-rosmaster", metavar="ip addr", help="IP address for a remote ROS master instance. If this is not specified, a local ROS Master will be launched.", nargs=1)
    parser.add_argument("--daemon", help="Launch a daemon process in the background.", action="store_true")
    parser.add_argument("--kill", help="Stop an existing ROGR instance, but don't launch another", action="store_true")
    args = parser.parse_args()
    if args.remote_rosmaster:
        rosmaster_ip = args.remote_rosmaster[0]
    else:
        rosmaster_ip = None

    ROSMASTER_IP = rosmaster_ip
    interactive = not args.no_interactive

    # check to see if another instance is already running
    killed = check_already_running(interactive)

    if args.kill:
        if not killed:
            print "No ROGR instance found."
        sys.exit(0)


    if args.daemon:
        logfile = open(os.path.join(HOME, "rogr.log"), "w")
        context = daemon.DaemonContext(stdout=logfile, stderr=logfile)
        print "ROGR instance is now running in daemon mode. Use %s --kill to stop the instance" % sys.argv[0]
        with context:
            main(rosmaster_ip)
    else:
        main(rosmaster_ip)




