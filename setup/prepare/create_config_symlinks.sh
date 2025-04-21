#!/usr/bin/env bash

prefix=$(get_script_prefix "create_config_symlinks")

dotfile_dir="${HOME}/developer/dotfiles"
symlinks=(
    ".config/ghostty"
    ".config/nvim"
    ".config/starship.toml"
    ".scripts"
    ".profile"
    ".bash_profile"
    ".bashrc"
    ".tmux.conf"
)


for symlink in "${symlinks[@]}"; do
    # check if symlink/file/directory exists and remove it
    if [ -e "${HOME}/${symlink}" ]; then
        warning $prefix "directory or file ${HOME}/${symlink} exists and will be replaced by symlink" 
        rm -rf "${HOME}/${symlink}"
    fi

    # link configuration item to destination
    info $prefix "linking ${dotfile_dir}/${symlink} to ${HOME}/${symlink}"    
    ln -s "${dotfile_dir}/${symlink}" "${HOME}/${symlink}"
done

# write final message for this script
finish $prefix
