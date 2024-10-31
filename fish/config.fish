alias vim="nvim"
alias cat="bat"
alias rm="rm -rf"
alias grep="rg"
alias ls="eza --icons=always"
eval "$(zoxide init fish)"

alias cd="z"

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opam configuration
source /Users/lpturmel/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/lpturmel/anaconda3/bin/conda
    eval /Users/lpturmel/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

