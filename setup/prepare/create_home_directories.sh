#!/usr/bin/env bash
set -euo pipefail


prefix=$(get_script_prefix "create_home_directories")
directories=(
    "$HOME/.ssh"
    "$HOME/.config"
    "$HOME/temporary"
    "$HOME/developer/confidential"
    "$HOME/developer/databases"
    "$HOME/developer/useful"
    "$HOME/developer/workspaces"
    "$HOME/developer/workspaces/work"
    "$HOME/developer/workspaces/build"
)


for directory in "${directories[@]}"; do
    info ${prefix} "creating directory ${directory}"
    mkdir -pm 700 $directory
done

# write final message for this script
finish $prefix
