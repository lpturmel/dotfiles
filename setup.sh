#!/bin/bash

# Setup zsh common theme
echo "Installing Powerlevel10k zsh theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing lsd..."
brew install lsd

echo "Done installing common zsh theme..."
