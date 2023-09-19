#!/bin/sh -e

# Make sure the folder exists
mkdir -p $SNAP_COMMON/config

cp $SNAP/usr/share/rosbot-xl-nav/config/*.yaml $SNAP_COMMON/config/.
