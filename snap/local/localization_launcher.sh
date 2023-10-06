#!/usr/bin/bash -e

LOC_CONFIG_FILE="$(snapctl get localization-config)"
MAP_FILE="$(snapctl get map)"
SIMULATION="$(snapctl get simulation)"

ros2 launch nav2_bringup localization_launch.py \
  params_file:=${LOC_CONFIG_FILE} map:=${MAP_FILE} use_sim_time:=${SIMULATION}
