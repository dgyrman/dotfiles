#!/usr/bin/env bash

purple="\033[0;35m"
prefix="${purple}[install]${nc}"

dotfiles_dir="${HOME}/developer/dotfiles"


echo "$prefix cloning dotfiles repo"
git clone https://github.com/dgyrman/dotfiles.git $dotfiles_dir

cd $dotfiles_dir/setup
./run.sh
