#!/usr/bin/bash

$SNAP/opt/ros/underlay_ws/opt/ros/$ROS_DISTRO/bin/ros2 service call /mux/select topic_tools_interfaces/srv/MuxSelect "{topic: /nav_vel}"
exec $@
