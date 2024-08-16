#!/usr/bin/env zsh

script_prefix="[Basic Setup]"

#-----------------------------------------------------------------------------------------------------------------------
# Creating .config directory
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Creating config directory"
mkdir -p ~/.config

#-----------------------------------------------------------------------------------------------------------------------
# Creating symlinks
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Creating symlinks"

rm -rf ~/.config/alacritty ~/.config/nvim 

ln -sf ~/Developer/dotfiles/.config/alacritty		 ~/.config
ln -sf ~/Developer/dotfiles/.config/nvim			 ~/.config 
ln -sf ~/Developer/dotfiles/.config/macchina/		 ~/.config
ln -sf ~/Developer/dotfiles/.config/starship.toml	 ~/.config

ln -sf ~/Developer/dotfiles/.scripts				 ~
ln -sf ~/Developer/dotfiles/.tmux.conf				 ~
ln -sf ~/Developer/dotfiles/.zshrc					 ~
ln -sf ~/Developer/dotfiles/.zshenv					 ~

#-----------------------------------------------------------------------------------------------------------------------
# Separate installation by plattform 
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix What is currently installed?"
select plattform in "macOS" "Linux"; do
    case $plattform in
        macOS ) ./additional-setup-mac.zsh; break;;
        Linux ) ./additional-setup-linux.zsh; break;;
    esac
done

#-----------------------------------------------------------------------------------------------------------------------
# Saying goodbye
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Done"
