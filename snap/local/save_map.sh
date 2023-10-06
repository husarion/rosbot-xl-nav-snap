#!/usr/bin/bash

MAP_DIR="${SNAP_COMMON}/maps"
MAP_IMG_EXT="png"
MAP_FILE_NO_EXT="${MAP_DIR}/new_map"
MAP_TOPIC="map"
MAP_FREE_THRESH="0.15"
MAP_OCC_THRESH="0.65"
MAP_MODE="trinary"

# Create map directory if it doesn't exist
mkdir -p ${MAP_DIR}

ros2 service call /map_saver/save_map nav2_msgs/srv/SaveMap \
  "{map_topic: ${MAP_TOPIC}, map_url: ${MAP_FILE_NO_EXT}, \
  image_format: ${MAP_IMG_EXT}, map_mode: ${MAP_MODE}, \
  free_thresh: ${MAP_FREE_THRESH}, occupied_thresh: ${MAP_OCC_THRESH}}"
