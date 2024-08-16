#!/usr/bin/env zsh

script_prefix="[Linux Setup]"

#-----------------------------------------------------------------------------------------------------------------------
# Creating symlinks
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Creating symlinks"

ln -sf ~/Developer/dotfiles/.config/rofi/		~/.config
ln -sf ~/Developer/dotfiles/.config/polybar/	~/.config
ln -sf ~/Developer/dotfiles/.config/picom		~/.config
ln -sf ~/Developer/dotfiles/.config/i3			~/.config
