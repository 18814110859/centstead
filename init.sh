#!/usr/bin/env bash

UserConfigPath=~/.homestead

mkdir -p "$UserConfigPath"

cp -i src/stubs/config.yaml "$UserConfigPath/config.yaml"
cp -i src/stubs/after.sh "$UserConfigPath/after.sh"
cp -i src/stubs/aliases "$UserConfigPath/aliases"

echo "Box initialized!"
