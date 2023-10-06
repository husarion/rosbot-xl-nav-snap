#!/usr/bin/bash

SLAM_CONFIG_FILE="$(snapctl get slam-config)"
SIMULATION="$(snapctl get simulation)"

${SNAP}/ros2 launch nav2_bringup slam_launch.py \
  params_file:=${SLAM_CONFIG_FILE} use_sim_time:=${SIMULATION}
