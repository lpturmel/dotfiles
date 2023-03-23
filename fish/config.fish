alias vim="nvim"
alias ls="lsd"
alias cat="bat"
alias rm="rm -rf"
alias grep="rg"

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
