#!/usr/bin/env bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

USER_NAME=$1

sudo rm -rf /home/$USER_NAME/.config/home-manager

sudo mkdir -p /home/$USER_NAME/.config/home-manager
sudo cp $SCRIPTPATH/configs/$USER_NAME/flake.nix /home/$USER_NAME/.config/home-manager/flake.nix
sudo cp $SCRIPTPATH/configs/$USER_NAME/home.nix /home/$USER_NAME/.config/home-manager/home.nix
sudo cp -r $SCRIPTPATH/modules /home/$USER_NAME/.config/home-manager/modules

sudo chown -R $USER_NAME /home/$USER_NAME/.config/home-manager

sudo -u $USER_NAME home-manager switch --show-trace