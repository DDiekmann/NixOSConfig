#!/usr/bin/env bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

PS3='Please enter the user home system to update: '
options=("dennisd" "private" "gaming" "Quit")

select opt in "${options[@]}"; do
    case $opt in
        "Quit")
            break
            ;;
        *) 
            sudo bash $SCRIPTPATH/../home/update.sh $opt
            break
            ;;
    esac
done