@echo off

set UserConfigPath=config

mkdir %UserConfigPath%

copy /-y src\stubs\config.yaml "%UserConfigPath%\\config.yaml"
copy /-y src\stubs\after.sh "%UserConfigPath%\\after.sh"
copy /-y src\stubs\aliases "%UserConfigPath%\\aliases"

set UserConfigPath=
echo Box initialized!