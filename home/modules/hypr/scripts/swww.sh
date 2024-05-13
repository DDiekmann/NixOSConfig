#!/usr/bin/env bash

wallpapersDir=$HOME/.config/home-manager/modules/hypr/wallpapers/

swww-daemon &
BACK_PID=$!
wait $BACK_PID

cd $wallpapersDir

while true; do
    ls |sort -R |tail -$N |while read file; do
        swww img "$file" &
        sleep 1h
    done
done
