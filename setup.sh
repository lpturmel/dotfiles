#!/bin/bash

# Setup zsh common theme
wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
echo "Done installing common zsh theme..."
echo "Run :CocInstall coc-prettier in vim to finish the prettier installation!"
