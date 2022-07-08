
# Path to your oh-my-zsh installation.
export ZSH="/Users/lpturmel/.oh-my-zsh"
# Set theme
ZSH_THEME="lambda"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
SPACESHIP_NODE_SHOW=false
SPACESHIP_GIT_STATUS_SHOW=false

alias vim="nvim"
alias g="git"
alias ls="lsd"
alias rm="rm -rf"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# bun completions
[ -s "/Users/lpturmel/.bun/_bun" ] && source "/Users/lpturmel/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/lpturmel/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
