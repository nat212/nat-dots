#!/bin/bash

# see man zscroll for documentation of the following parameters
~/.nix-profile/bin/zscroll -l 30 \
        --delay 0.1 \
        --matchcommand "/home/natasha/.config/polybar/scripts/get_player_status.sh" \
        --matchtext "Playing" --scroll 1 \
        --matchtext "Paused" --scroll 0 \
        --newline \
        --updatecheck ~/.config/polybar/scripts/get_spotify_status.sh &
wait
