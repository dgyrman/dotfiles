#!/usr/bin/env zsh

script_prefix="[SETUP]"

#-----------------------------------------------------------------------------------------------------------------------
# Creating .config directory
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Creating config directory"
mkdir -p ~/.config

#-----------------------------------------------------------------------------------------------------------------------
# Creating symlinks
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Creating symlinks"

rm -rf ~/.config/ghostty 
rm -rf ~/.config/nvim 

ln -sf ~/Developer/dotfiles/.config/ghostty		 ~/.config
ln -sf ~/Developer/dotfiles/.config/nvim		 ~/.config 
ln -sf ~/Developer/dotfiles/.config/macchina		 ~/.config
ln -sf ~/Developer/dotfiles/.config/starship.toml	 ~/.config

ln -sf ~/Developer/dotfiles/.scripts			 ~
ln -sf ~/Developer/dotfiles/.tmux.conf			 ~
ln -sf ~/Developer/dotfiles/.zshrc			 ~
ln -sf ~/Developer/dotfiles/.zshenv			 ~
