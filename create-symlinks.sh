#!/bin/bash

echo "----removing old config files and creating new symlinks----"
# remove old config files
sudo rm -rf ~/.gitconfig >/dev/null 2>&1
sudo rm -rf ~/.zshrc >/dev/null 2>&1
sudo rm -rf ~/.bashrc >/dev/null 2>&1
sudo rm -rf ~/.profile >/dev/null 2>&1
sudo rm -rf ~/Brewfile >/dev/null 2>&1
sudo rm -rf ~/.warp >/dev/null 2>&1
sudo rm -rf ~/.config/bat >/dev/null 2>&1
sudo rm -rf ~/.config/nvim >/dev/null 2>&1
sudo rm -rf ~/.config/wezterm >/dev/null 2>&1
sudo rm -rf ~/.config/ohmyposh >/dev/null 2>&1
sudo rm -rf ~/.config/zellij >/dev/null 2>&1
sudo rm -rf ~/.config/atuin >/dev/null 2>&1

SYMLINKS=()
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
SYMLINKS+=('.gitconfig')

ln -sf ~/.dotfiles/terminal/.zshrc ~/.zshrc
SYMLINKS+=('.zshrc')

ln -sf ~/.dotfiles/terminal/.bashrc ~/.bashrc
SYMLINKS+=('.bashrc ')

ln -sf ~/.dotfiles/terminal/.profile ~/.profile
SYMLINKS+=('.profile ')

ln -sf ~/.dotfiles/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

ln -sf ~/.dotfiles/.warp ~/.warp
SYMLINKS+=('.warp')

mkdir .config
ln -sf ~/.dotfiles/nvim ~/.config/nvim
SYMLINKS+=('nvim')

ln -sf ~/.dotfiles/bat/ ~/.config/bat
SYMLINKS+=('bat')

ln -sf ~/.dotfiles/ohmyposh/ ~/.config/ohmyposh
SYMLINKS+=('ohmyposh')

ln -sf ~/.dotfiles/zellij/ ~/.config/zellij
SYMLINKS+=('zellij')

ln -sf ~/.dotfiles/atuin/config.toml ~/.config/atuin/config.toml
SYMLINKS+=('atuin')

ln -sf ~/.dotfiles/wezterm/ ~/.config/wezterm
SYMLINKS+=('wezterm')

echo "The following symlinks have been created:\n"
echo ${SYMLINKS[@]}
