#!/usr/bin/env bash

UserConfigPath=config

mkdir -p "$UserConfigPath"

cp -i stubs/config.yaml "$UserConfigPath/config.yaml"
cp -i stubs/after.sh "$UserConfigPath/after.sh"
cp -i stubs/aliases "$UserConfigPath/aliases"

echo "Box initialized!"
