#!/usr/bin/bash
set -e

MAP_DIR="${SNAP_COMMON}/maps"
MAP_IMG_EXT=".png"

MAP_FILE_NO_EXT="${MAP_DIR}/new_map"
MAP_CONFIG_FILE="${MAP_FILE_NO_EXT}.yaml"
MAP_IMG_FILE="${MAP_FILE_NO_EXT}${MAP_IMG_EXT}"

if [ ! -f ${MAP_CONFIG_FILE} ]; then
  >&2 echo "Could not find the new map configuration file!"
  exit 1
fi

if [ ! -f ${MAP_IMG_FILE} ]; then
  >&2 echo "Could not find the new map file!"
  exit 1
fi

# backup our map with the date and time
DATE=`date +%Y%m%d-%H-%M-%S`

BACKED_MAP_FILE_NO_EXT="${MAP_DIR}/$DATE"
BACKED_MAP_CONFIG_FILE="${BACKED_MAP_FILE_NO_EXT}.yaml"
BACKED_MAP_IMG_FILE="${BACKED_MAP_FILE_NO_EXT}${MAP_IMG_EXT}"

mv ${MAP_CONFIG_FILE} ${BACKED_MAP_CONFIG_FILE}
sed -i "s/new_map${MAP_IMG_EXT}/$DATE${MAP_IMG_EXT}/" ${BACKED_MAP_CONFIG_FILE}
mv ${MAP_IMG_FILE} ${BACKED_MAP_IMG_FILE}

# create symlink to use the map
rm -f ${MAP_DIR}/current_map.yaml
ln -s ${BACKED_MAP_CONFIG_FILE} ${MAP_DIR}/current_map.yaml
