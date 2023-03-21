#!/bin/bash
#echo 0000 | sudo -S pkill -9 ros
#sleep 1
echo ' ' | sudo -S pkill -9 gzserver
echo ' ' | sudo -S pkill -9 gzclient
CRTDIR=$(cd "$(dirname "$0")";pwd)
echo $CRTDIR
# sleep 2
current_ws=$(dirname $(dirname $(dirname $CRTDIR)))
export LD_LIBRARY_PATH=$current_ws/devel/lib:/opt/ros/noetic/lib
# echo $LD_LIBRARY_PATH


cd ~/PX4-Autopilot
DONT_RUN=1 make px4_sitl_default gazebo
CRTDIRPX4=~/PX4-Autopilot
#source ~/han_ws/devel/setup.bash    # (optional)
source Tools/setup_gazebo.bash $CRTDIRPX4 $CRTDIRPX4/build/px4_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$CRTDIRPX4
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$CRTDIRPX4/Tools/sitl_gazebo
echo $ROS_PACKAGE_PATH
export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$current_ws/src/gazebo_playground/gazebo
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$current_ws/src/gazebo_playground/gazebo/models
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:$current_ws/devel/lib:$current_ws/src/gazebo_playground/gazebo/actor_collisions/build

echo $GAZEBO_RESOURCE_PATH
echo $GAZEBO_MODEL_PATH
echo $GAZEBO_PLUGIN_PATH

roslaunch gazebo_sim gazebo_sim_dyn.launch pause:=false
# sleep 3
