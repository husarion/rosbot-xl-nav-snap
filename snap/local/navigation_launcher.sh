#!/usr/bin/bash

NAV_CONFIG_FILE="$(snapctl get navigation-config)"
SIMULATION="$(snapctl get simulation)"

ros2 launch nav2_bringup navigation_launch.py \
  params_file:=${NAV_CONFIG_FILE} use_sim_time:=${SIMULATION}
