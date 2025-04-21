alias l="ls --color -lAhkgs --group-directories-first"
if [ "$(uname -o)" == "Darwin" ]; then
    alias l="gls --color -lAhkgs --group-directories-first"
fi
alias ll="l"

alias vi="nvim"
alias vim="nvim"
alias c="clear"
alias dev="cd $CUSTOM_DEV_DIR"
alias md="glow"
alias venv="source .venv/bin/activate"
alias tks="tmux kill-session"

alias gf="git fetch"
alias gs="git status"
alias gc="git checkout"
alias ga="git add"
alias gcm="git commit -S -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate --all"

[ -f ~/.scripts/workspace-changer.sh ] && source ~/.scripts/workspace-changer.sh
[ -f ~/.scripts/start-tmux.sh ] && source ~/.scripts/start-tmux.sh

eval "$(starship init bash)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
