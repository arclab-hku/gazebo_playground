#!/bin/bash
sleep 15
echo “boost IMU!”
rosrun mavros mavcmd long 511 31  6000 0 0 0 0 0
rosrun mavros mavcmd long 511 105 6000 0 0 0 0 0
