#!/usr/bin/env bash
echo $(playerctl --ignore-player=chromium,firefox status 2>&1)
exit 0
