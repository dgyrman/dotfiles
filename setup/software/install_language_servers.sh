#!/usr/bin/env bash

prefix=$(get_script_prefix "install_language_servers")

luals_build_dir="$HOME/developer/workspaces/build/lua-language-server"
luals_bin_dir="$HOME/.local/bin"
superhtml_bin_dir="$HOME/.local/bin"

language_servers=(
    "basedpyright"
    "bash-language-server"
    "vscode-langservers-extracted"
    "css-variables-language-server"
    "intelephense"
    "typescript-language-server"
    "typescript"
)


# install most of the servers using npm
info ${prefix} "installing following using npm: ${language_servers[@]}"
npm i -g "${language_servers[@]}"

# clone, navigate to and build lua language server  
info ${prefix} "manually installing the goddamn lua language server"
git clone https://github.com/LuaLS/lua-language-server $luals_build_dir
cd $luals_build_dir
./make.sh

# create corresponding bin dir for lua language server
# copy startup script and correct permissions
cp -f "$HOME/developer/dotfiles/setup/software/templates/lua-language-server" $luals_bin_dir 
chmod +x "${luals_bin_dir}/lua-language-server"

# download superhtml language server without building it
info ${prefix} "manually installing the goddamn html language server"
mkdir -p $superhtml_bin_dir

# platform corresponds to filename of the binary on relases page in reporsitory
platform="aarch64-macos"
if [[ "$(uname -o)" == "Linux" && -e "/etc/fedora-release" ]]; then
    platfrom="x86_64-linux-musl"
fi

# download, unpack, move binary and cleanup
wget "https://github.com/kristoff-it/superhtml/releases/download/v0.5.3/${platform}.tar.gz" \
    -O "$superhtml_bin_dir/${platform}.tar.gz"

tar -C "$superhtml_bin_dir" -xzvf "$superhtml_bin_dir/${platform}.tar.gz" 
mv "${superhtml_bin_dir}/${platform}/superhtml" $superhtml_bin_dir

rm -rf "$superhtml_bin_dir/${platform}.tar.gz" "$superhtml_bin_dir/${platform}"

# write final message for this script
finish $prefix
