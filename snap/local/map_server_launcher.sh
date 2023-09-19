#!/usr/bin/bash

if [[ -z "${ROSBOT_XL_MAP_SERVER_MAP_FILE}" ]]; then
  export ROSBOT_XL_MAP_SERVER_MAP_FILE="$SNAP_COMMON/maps/current_map.yaml"
fi

# ros2 run nav2_map_server map_server --params-file:=$ROSBOT_XL_MAP_SERVER_PARAM_FILE
ros2 run nav2_map_server map_server --ros-args -p yaml_filename:=$ROSBOT_XL_MAP_SERVER_MAP_FILE

sleep 3

ros2 run nav2_util lifecycle_bringup map_server
