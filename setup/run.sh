#!/usr/bin/env bash

set -euo pipefail

source "./variables.sh"

scripts=(
    # prepare system
    "./prepare/create_home_directories.sh"
    "./prepare/create_config_symlinks.sh"

    # install software
    "./software/install_basic_software.sh"
    "./software/install_neovim.sh"
    "./software/install_golang.sh"
    "./software/install_language_servers.sh"
    "./software/install_ghostty.sh"
)

for script in "${scripts[@]}"; do
    source script
    cleanup    
done

# reload shell
exec bash -l
