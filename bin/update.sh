#!/bin/sh

echo "------- Brew Upgrade"
brew upgrade

echo "------- Oh My Zsh"
env ZSH=$ZSH sh $ZSH/tools/upgrade.sh

echo "------- Brew Cask App Update"
brew cu

echo "------- Python"
pip-review --auto

echo "------- Ruby"
(cd ~ && gem update --no-doc --no-ri)

echo "------- Mac App Store"
mas upgrade

echo "------- Neovim Plugins"
nvim +PlugUpdate
