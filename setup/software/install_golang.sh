#!/usr/bin/env bash
set -euo pipefail

prefix=$(get_script_prefix "install_golang")

installation_path="/usr/local"
file="go1.24.2.linux-amd64.tar.gz"


# override name of the archive we want to download, if macOS is used
if [ "$(uname -o)" == "Darwin" ]; then
    file="go1.24.2.darwin-arm64.tar.gz" 
fi 

# navigate into installation path and remove old go directory 
cd $installation_path && rm -rf go 

# download go
info $prefix "starting download and installation"
sudo wget https://go.dev/dl/$file

# untar and rm archive
sudo tar -xzvf $file 
sudo rm $file

finish $prefix
