#!/usr/bin/env bash

# source variable and common functions
source ./variables.sh

# prepare system
source ./prepare/create_home_directories.sh
source ./prepare/create_config_symlinks.sh

# install software
source ./software/install_basic_software.sh
source ./software/install_neovim.sh
source ./software/install_language_servers.sh
source ./software/install_ghostty.sh
