#!/usr/bin/env bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

cp $SCRIPTPATH/python-shell.nix ./python-shell.nix
cp $SCRIPTPATH/shell.nix ./shell.nix

nix-shell ./shell.nix