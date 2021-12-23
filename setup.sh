#!/bin/bash

# Setup zsh common theme
echo "Installing Powerlevel10k zsh theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Done!"

echo "Installing Neovim package manager (packer)"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Done!"

echo "Installing lsd..."
brew install lsd
echo "Done!"

