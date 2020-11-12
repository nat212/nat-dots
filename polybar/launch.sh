#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "No bar specified";
  exit 1;
fi

killall -q polybar

for param in "$@"; do
  bar=$(echo $param | cut -d':' -f1)
  monitor=$(echo $param | cut -d':' -f2)
  if [[ "$bar" == "$monitor" ]] || [[ -z "$monitor" ]]; then
    echo "Invalid format: $param"
    echo "Must be format <bar>:<monitor>"
    exit 1
  fi
  logfile="/tmp/polybar_${bar}.log"
  touch $logfile
  echo "Launching $bar"
  POLYBAR_MONITOR=$monitor polybar "$bar" >>$logfile 2>&1 & disown
done

echo "Bars launched..."
