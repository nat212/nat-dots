#!/bin/bash

if ! playerctl --player=spotify status >/dev/null 2>&1; then
  echo "No music is playing"
  polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 3 1>/dev/null 2>&1
  exit 0;
fi

if [ "$(playerctl --player=spotify status)" = "Stopped" ]; then
    echo "No music is playing"
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 3 1>/dev/null 2>&1
elif [ "$(playerctl --player=spotify status)" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 2 1>/dev/null 2>&1
    playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}"
else # Can be configured to output differently when player is paused
    polybar-msg -p "$(pgrep -f "polybar main")" hook spotify-play-pause 1 1>/dev/null 2>&1
    playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}"
fi

exit 0
