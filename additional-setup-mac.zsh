#!/usr/bin/env zsh

script_prefix="[macOS Setup]"

#-----------------------------------------------------------------------------------------------------------------------
# Defining required applications
#-----------------------------------------------------------------------------------------------------------------------
required_applications=("brew", "yabai", "skhd")

#----------------------------------------------------------------------------------------------------------------------- 
# Checking if applications are installed
#-----------------------------------------------------------------------------------------------------------------------
echo "$script_prefix Checking if required apps are installed"
for app in $required_applications; do
	if ! command -v $app &> /dev/null
	then
		echo "$script_prefix Required $app could not be found."
	fi 
done

#-----------------------------------------------------------------------------------------------------------------------
# Creating symlinks
#-----------------------------------------------------------------------------------------------------------------------
echo "[macOS Setup] Creating symlinks"

ln -sf ~/Developer/dotfiles/.yabairc	~
ln -sf ~/Developer/dotfiles/.skhdrc		~
