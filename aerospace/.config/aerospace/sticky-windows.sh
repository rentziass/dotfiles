#!/bin/bash
set -e

# this script comes from https://github.com/nikitabobko/AeroSpace/issues/2#issuecomment-3041947801

echo "CALLED sticky-windows.sh" >> /tmp/sticky-windows.log

current_monitor=$(aerospace list-monitors --focused | awk '{print $1}')
current_workspace=$(aerospace list-workspaces --focused)
sticky_windows="(Countdown)" # e.g. "(Spotify|Slack)"
win_list=$(aerospace list-windows --monitor "$current_monitor" | grep -E "$sticky_windows" | awk '{print $1}')

echo "$win_list" | while IFS= read -r number; do
  echo "Processing number: $number"
  aerospace move-node-to-workspace --window-id "$number" "$current_workspace" < /dev/null
  echo "continue"
done

