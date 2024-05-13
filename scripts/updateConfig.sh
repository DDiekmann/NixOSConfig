#!/usr/bin/env bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

sudo rsync -a $SCRIPTPATH/../nixos /etc
sudo nixos-rebuild switch --flake /etc/nixos#default