#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
  echo "Usage:
  $0 <dir containing images>"
  exit 1
fi

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=3

cd $1
IMG=$(ls -1 |  shuf | head -1)
swww img "$IMG"
wal -i "$IMG"
sh ~/Scripts/swww-copy.sh
