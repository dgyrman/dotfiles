#!/usr/bin/env bash
set -euo pipefail


prefix=$(get_script_prefix "install_language_servers")

luals_bin_dir="$HOME/.local/bin"
luals_app_dir="$HOME/.local/share"
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
info ${prefix} "installing following using npm: ${language_servers[*]}"
volta install "${language_servers[@]}"

# install gopls
info ${prefix} "manually installing go language server (gopls)"
go install golang.org/x/tools/gopls@latest

# clone, navigate to, update and build lua language server  
info ${prefix} "manually installing lua language server"
platform="lua-language-server-3.14.0-darwin-arm64"
if [ -e "/etc/fedora-release" ]; then
    platfrom="lua-language-server-3.14.0-linux-x64-musl"
fi

# download, unpack, move binary and cleanup
wget "https://github.com/LuaLS/lua-language-server/releases/download/3.14.0/${platform}.tar.gz" \
    -O "$luals_app_dir/${platform}.tar.gz"

mkdir -p "$luals_app_dir/lua-language-server"
tar -C "$luals_app_dir/lua-language-server" -xzvf "$luals_app_dir/${platform}.tar.gz" 
rm -rf "$luals_app_dir/${platform}.tar.gz"

# create corresponding bin dir for lua language server
# copy startup script and correct permissions
cp -f "$HOME/developer/dotfiles/setup/software/templates/lua-language-server" $luals_bin_dir 
chmod +x "${luals_bin_dir}/lua-language-server"

# download superhtml language server without building it
info ${prefix} "manually installing html language server"
mkdir -p $superhtml_bin_dir

# platform corresponds to filename of the binary on relases page in reporsitory
platform="aarch64-macos"
if [ -e "/etc/fedora-release" ]; then
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
