#!/usr/bin/env bash

prefix=$(get_script_prefix "install_ghostty")
zig_bin_dir="$HOME/developer/bin/zig/bin"
ghostty_build_dir="${HOME}/developer/workspaces/build/ghostty"
ghostty_version="v1.1.3"

# if setup runs on macOS just exit, I don't want to mess with xcode
if [ "$(uname -o)" == "Darwin" ]; then
    error $prefix "just download dmg, don't even bother to mess with xcode shit"
    return
fi

# install requirements
sudo dnf install gtk4-devel zig libadwaita-devel blueprint-compiler gettext

if [ ! -d $ghostty_build_dir ]; then
    warning $prefix "ghostty is not cloned yet"

    info $prefix "cloning ghostty"
    git clone https://github.com/ghostty-org/ghostty.git $ghostty_build_dir 
fi

# navigating into repository, fetching updates and checkout current version
info $prefix "fetching updates and choosing version ${ghostty_version}"
cd $ghostty_build_dir
git fetch
git checkout tags/${ghostty_version} main

# build ghostty
info $prefix "building ghostty into ${HOME}/.local"
zig build -p $HOME/.local -Doptimize=ReleaseFast

# write final message for this script
finish $prefix
