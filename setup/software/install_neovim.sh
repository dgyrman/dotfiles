#!/usr/bin/env bash

prefix=$(get_script_prefix "install_neovim")

neovim_build_directory="$HOME/developer/workspaces/build/neovim"
branch="release-0.11"


# install required package to build neovim
info ${prefix} "installing prerequisites"
if [[ "$(uname -o)" == "Linux" && -e "/etc/fedora-release" ]]; then
    sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
elif [[ "$(uname -o)" == "Darwin" ]]; then
    brew install ninja cmake gettext curl
fi

# if repository is not cloned yet, dewit  
if [ ! -d "${neovim_build_directory}" ]; then
    warning ${prefix} "neovim not found in ${neovim_build_directory}"

    info ${prefix} "cloning neovim from branch ${branch} into ${neovim_build_directory}"
    git clone https://github.com/neovim/neovim.git $neovim_build_directory 
fi

# navigate into direcotory, fetch updates, switch to version branch
cd $neovim_build_directory
git fetch
git switch "${branch}"

# remove caches
rm -rf build/ 

# build the beauty
info ${prefix} "compiling neovim now"
make CMAKE_EXTRA_FLAGS="-DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/.local"
make install 

# write final message for this script
finish $prefix
