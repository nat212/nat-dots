#!/usr/bin/env bash
echo $(playerctl --player=spotify status 2>&1)
exit 0
