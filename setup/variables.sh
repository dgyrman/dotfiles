#!/usr/bin/env bash

export purple="\033[0;35m"
export yellow="\033[1;33m"
export red="\033[0;91m"
export green="\033[0;92m"
export nc="\033[0m"

get_script_prefix() {
    echo "${purple}[${1}]${nc}"
}

info() {
    echo -e "${1} ${2}"
}

warning() {
    echo -e "${1} ${yellow}${2}${nc}"
}

error() {
    echo -e "${1} ${red}${2}${nc}"
}

cleanup() {
    cd $HOME/developer/dotfiles/setup
    source $HOME/.profile
}

export -f get_script_prefix
export -f info
export -f warning
export -f error
export -f reset
