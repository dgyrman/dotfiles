#!/usr/bin/env bash

prefix=$(get_script_prefix "install_basic_software")
packages=(
    "tmux"
    "bash"
    "fzf"
    "wget"
    "curl"
)


if [ "$(uname -o)" == "Darwin" ]; then
    # check if brew is installed, if not dewit
    
    info ${prefix} "macOS detected, checking if brew is installed"
    if command -v brew >/dev/null 2>&1; then
        info ${prefix} "brew is installed"
    else
        info ${prefix} "brew is not installed, installing now"

        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        info ${prefix} "successfully installed brew"
    fi
   
    # add GNU core utils
    packages+=("coreutils")

    # finally install the shit
    info ${prefix} "installing following packages ${packages[*]}"
    brew install $packages[*]
fi

if [ -e "/etc/fedora-release" ]; then
    echo -e "${prefix} ${purple}You are... using Fedora? Fuiyoh! Installing packages now${nc}"
    sudo dnf install $packages[*]
fi

# install volte (node version manager) 
info ${prefix} "installing node version manager"
curl https://get.volta.sh | bash

# install pyenv (python version manager)
info ${prefix} "installing python version manager"
if [ "$(uname -o)" == "Darwin" ]; then
    brew install pyenv
fi

if [ -e "/etc/fedora-release" ]; then
    curl -fsSL https://pyenv.run | bash
fi

# write final message for this script
finish $prefix
