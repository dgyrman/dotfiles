#!/usr/bin/env bash

set -euo pipefail

prefix=$(get_script_prefix "install_neovim")
neovim_build_directory="$HOME/developer/workspaces/build/neovim"
branch="release-0.11"

# install required package to build neovim
info ${prefix} "installing prerequisites"
sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra

# if repository is not cloned yet, dewit  
if [ ! -d "${neovim_build_directory}" ]; then
    warning ${prefix} "neovim not found in ${neovim_build_directory}"

    info ${prefix} "cloning neovim from branch ${branch} into ${neovim_build_directory}"
    git clone -b ${branch} https://github.com/neovim/neovim.git $neovim_build_directory 

    cd $neovim_build_directory
else
    cd $neovim_build_directory

    info ${prefix} "pulling updates from ${branch}"
    git pull
    
    info ${prefix} "removing build folder"
    [ -d build ] && rm -rf build/ 
fi

# build the beauty
info ${prefix} "starting compilation"
make CMAKE_EXTRA_FLAGS="-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/.local"
make install 
