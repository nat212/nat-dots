#!/usr/bin/env bash

export PRIMARY_MONITOR=$(polybar -m | grep 'primary' | cut -d':' -f1)
export SECONDARY_MONITOR=$(polybar -m | grep -v 'primary' | head | cut -d':' -f1)

if [[ -z "$1" ]]; then
  echo "No bar specified";
  exit 1;
fi

killall -q polybar

for bar in "$@"; do
  logfile="/tmp/polybar_${bar}.log"
  touch $logfile
  echo "Launching $bar"
  polybar "$bar" >>$logfile 2>&1 & disown
done

echo "Bars launched..."
