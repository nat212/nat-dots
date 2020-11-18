#!/usr/bin/env bash
echo $(playerctl --ignore-player=chromium status 2>&1)
exit 0
