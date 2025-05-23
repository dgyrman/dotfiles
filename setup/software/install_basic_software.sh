#!/usr/bin/env bash

set -euo pipefail

prefix=$(get_script_prefix "install_basic_software")

packages=(
    "tmux"
    "bash"
    "fzf"
    "wget"
    "curl"
)

sudo dnf install "${packages[@]}"

# install volte (node version manager) 
info ${prefix} "installing node version manager"
curl https://get.volta.sh | bash -s -- --skip-setup

# install version 22 as default version
volta install node@22

# install pyenv (python version manager)
info ${prefix} "installing python version manager"
curl -fsSL https://pyenv.run | bash
