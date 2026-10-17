#!/usr/bin/env bash

set -euo pipefail

lua_directory="$(pwd)/lua"
run_directory="$(pwd)/run"
ccemux_jar_file="$run_directory/ccemux.jar"

[ -d "$lua_directory" ] || {
    echo 'Missing lua directory, check your current path!'
    exit 1
}

[ -d "$run_directory" ] || mkdir "$run_directory" --parents
[ -f "$ccemux_jar_file" ] || curl https://emux.cc/ccemux-launcher.jar --output="$ccemux_jar_file"

java -jar "$ccemux_jar_file" --start-dir="$lua_directory" --data-dir="$run_directory"
