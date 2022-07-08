#!/bin/bash


echo "Setting zshrc..."
# symlink .zshrc to home directory
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/nvim ~/.config/nvim

echo "Installing Neovim package manager (packer)"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Done!"

echo "Installing homebrew packages..."
brew install lsd ripgrep neovim
echo "Done!"

