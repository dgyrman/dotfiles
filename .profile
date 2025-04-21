export GOPATH="$HOME/.golang"
export PYENV_ROOT="$HOME/.pyenv"
export VOLTA_HOME="$HOME/.volta"

export CUSTOM_DEV_DIR="$HOME/developer"
export CUSTOM_WS_DIR="$CUSTOM_DEV_DIR/workspaces"
export CUSTOM_BIN_DIR="$CUSTOM_DEV_DIR/bin"

if [[ "$(uname -o)" == "Darwin" ]]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && eval "$(pyenv init - bash)"

[[ -d $VOLTA_HOME ]] && export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
