#!/usr/bin/env bash

set -euo pipefail

lua_directory="$(pwd)/lua"
run_directory="$(pwd)/run"
test_directory="$(pwd)/test"

ccemux_jar_file="$run_directory/ccemux.jar"

test_root_directory="$test_directory/.scs-root"
test_rom_directory="$test_root_directory/rom"
test_programs_directory="$test_root_directory/programs"

[ -d "$lua_directory" ] || {
    echo 'Missing lua directory, check your current path!'
    exit 1
}
[ -d "$test_directory" ] || {
    echo 'Missing test directory, check your current path!'
    exit 1
}

[ -d "$run_directory" ] || mkdir --parents "$run_directory"
[ -f "$ccemux_jar_file" ] || curl https://emux.cc/ccemux-launcher.jar --output="$ccemux_jar_file"

[ -d "$test_rom_directory" ] && rm -r "$test_rom_directory"
mkdir --parents "$test_rom_directory"
cp --recursive "$lua_directory/rom/"* "$test_rom_directory"

[ -d "$test_programs_directory" ] && rm -r "$test_programs_directory"
mkdir --parents "$test_programs_directory"
cp --recursive "$lua_directory/programs/"* "$test_programs_directory"

java -jar "$ccemux_jar_file" --start-dir="$test_directory" --data-dir="$run_directory"
