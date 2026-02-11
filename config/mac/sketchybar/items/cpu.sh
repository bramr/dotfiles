#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  label.color=$CPU_COLOR \
                      update_freq=2 \
                      icon.color=$CPU_COLOR   \
                      icon=􀫥  \
                      script="$PLUGIN_DIR/cpu.sh"
