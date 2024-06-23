#!/bin/bash

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=3

swww img $1
wal -i $1
sh ~/Scripts/swww-copy.sh
