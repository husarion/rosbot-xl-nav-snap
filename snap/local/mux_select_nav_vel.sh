#!/usr/bin/bash

ros2 service call /mux/select topic_tools_interfaces/srv/MuxSelect "{topic: /nav_vel}"
exec $@
