#!/usr/bin/env bash

set -euo pipefail

prefix=$(get_script_prefix "install_golang")
installation_path="/usr/local"
archive_file="go1.24.2.linux-amd64.tar.gz"

# navigate into installation path and remove old go directory 
cd $installation_path && rm -rf go 

# download go
info $prefix "starting download and installation"
sudo wget https://go.dev/dl/$archive_file

# untar and rm archive
sudo tar -xzvf $archive_file 
sudo rm $archive_file
