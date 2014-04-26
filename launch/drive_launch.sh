#!/bin/bash

source /home/xhab/.bashrc
source /home/xhab/xhab-rogr/catkin_ws/devel/setup.bash

export PYTHONPATH=/home/xhab/xhab-rogr/rogr_lib:$PYTHONPATH

rosrun xhab_rogr drive_controller.py

echo ""
echo "Exiting..."
sleep 3
