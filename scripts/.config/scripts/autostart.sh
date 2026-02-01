#!/usr/bin/env bash

#              _            _             _
#   __ _ _   _| |_ ___  ___| |_ __ _ _ __| |_
#  / _` | | | | __/ _ \/ __| __/ _` | '__| __|
# | (_| | |_| | || (_) \__ \ || (_| | |  | |_
#  \__,_|\__,_|\__\___/|___/\__\__,_|_|   \__|

swww-daemon &
wal -R &
while ! swww query > /dev/null 2>&1; do
  sleep 0.1
done
swww img "$(cat ~/.cache/wal/wal)"
dbus-update-activation-environment --systemd --all
