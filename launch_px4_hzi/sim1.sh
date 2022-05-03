#!/bin/bash
#echo 0000 | sudo -S pkill -9 ros
#sleep 1
echo 111 | sudo -S pkill -9 gzserver
echo 111 | sudo -S pkill -9 gzclient
sleep 2
export LD_LIBRARY_PATH=~/han_ws/devel/lib:/opt/ros/melodic/lib

#export PYTHONPATH=$PYTHONPATH:"/home/zuzu/.local/lib/python2.7/site-packages"

cd ~/PX4-Autopilot
DONT_RUN=1 make px4_sitl_default gazebo
#source ~/han_ws/devel/setup.bash    # (optional)
source Tools/setup_gazebo.bash $(pwd) $(pwd)/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Tools/sitl_gazebo

export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:~/han_ws/src/gazebo_sim/gazebo
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/han_ws/src/gazebo_sim/gazebo/models
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:~/han_ws/devel/lib

echo $GAZEBO_RESOURCE_PATH
echo $GAZEBO_MODEL_PATH
echo $GAZEBO_PLUGIN_PATH

roslaunch gazebo_sim gazebo_sim1.launch pause:=false
#sleep 3
