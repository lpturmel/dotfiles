alias vim="nvim"
alias ls="lsd"
alias cat="bat"
alias rm="rm -rf"
alias grep="rg"

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

pr-tracker pr azdo -o '2020Development' -p 'ARGvengers' -r thanos,vision
pr-tracker pr azdo -o '2020Development' -p 'Hulk IaC' -r hulk-iac

# opam configuration
source /Users/lpturmel/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
