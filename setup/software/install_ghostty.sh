#!/usr/bin/env bash

set -euo pipefail

prefix=$(get_script_prefix "install_ghostty")
ghostty_build_dir="${HOME}/developer/workspaces/build/ghostty"
version_tag="v1.1.3"

# install requirements
sudo dnf install gtk4-devel zig libadwaita-devel blueprint-compiler gettext

if [ ! -d $ghostty_build_dir ]; then
    warning $prefix "ghostty is not cloned yet"

    info $prefix "cloning ghostty"
    git clone -b https://github.com/ghostty-org/ghostty.git $ghostty_build_dir 
    
    cd $ghostty_build_dir
else
    cd $ghostty_build_dir
    git pull
fi

# navigating into repository, fetching updates and checkout current version
info $prefix "fetching updates and choosing version ${version_tag}"
git checkout tags/${version_tag}

# build ghostty
info $prefix "building ghostty into ${HOME}/.local"
zig build -p $HOME/.local -Doptimize=ReleaseFast
