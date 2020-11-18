#!/bin/bash

if ! playerctl --ignore-player=chromium status >/dev/null 2>&1; then
  echo "No music is playing"
  polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 3 1>/dev/null 2>&1
  exit 0;
fi

if [ "$(playerctl --ignore-player=chromium status)" = "Stopped" ]; then
    echo "No music is playing"
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 3 1>/dev/null 2>&1
elif [ "$(playerctl --ignore-player=chromium status)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl --ignore-player=chromium metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 1 1>/dev/null 2>&1
    playerctl --ignore-player=chromium metadata --format "{{ title }} - {{ artist }}"
fi

exit 0
