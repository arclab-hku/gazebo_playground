#!/bin/bash
sleep 15
echo “boost IMU!”
rosrun mavros mavcmd long 511 31 9000 0 0 0 0 0