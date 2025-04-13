software_to_install=("ghostty" "nvim" "starship" "zsh" "cargo" "glow")
script_prefix="[setup]"

#------------------------------------------------------------------------------
# creating config directory and removing previous configs
#------------------------------------------------------------------------------
echo "$script_prefix creating config directory and removing previous configs"
mkdir -p ~/.config

rm -rf ~/.config/ghostty 
rm -rf ~/.config/nvim 
rm -rf ~/.config/starship.toml
rm -rf ~/.scripts		
rm -rf ~/.tmux.conf		
rm -rf ~/.zshrc			
rm -rf ~/.zshenv		

#-------------------------------------------------------------------------------
# creating symlinks
#-------------------------------------------------------------------------------
echo "$script_prefix creating symlinks"

ln -sf ~/Developer/dotfiles/.config/ghostty		 ~/.config
ln -sf ~/Developer/dotfiles/.config/nvim		 ~/.config 
ln -sf ~/Developer/dotfiles/.config/starship.toml	 ~/.config

ln -sf ~/Developer/dotfiles/.scripts			 ~
ln -sf ~/Developer/dotfiles/.tmux.conf			 ~
ln -sf ~/Developer/dotfiles/.zshrc			 ~
ln -sf ~/Developer/dotfiles/.zshenv			 ~

#-------------------------------------------------------------------------------
# end script 
#-------------------------------------------------------------------------------
echo "$script_prefix you may need to install following software now:"
echo "$script_prefix > ${software_to_install[*]}"

echo "$script_prefix done"

