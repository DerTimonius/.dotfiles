#!/bin/bash

echo "----Installing Brew----"
if brew --version &>/dev/null; then
  echo "Brew is already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "export PATH='/usr/local/bin:$PATH'\n" >>~/.zprofile
  source ~/.zprofile
fi

brew doctor
brew update

echo "----install via Brewfile----"
cd ~
brew bundle
cd -

# build bat to add the theme
bat cache --build

echo "----activating pnpm----"
# activate pnpm and install some global deps
if node --version &>/dev/null; then
  corepack enable
  corepack prepare pnpm@latest --activate
  pnpm setup
else
  echo "Node not installed correctly, please check and activate pnpm manually"
fi

echo "----installing rust---"
if cargo --version &>/dev/null; then
  echo "Rust is already installed, skipping"
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

echo "----Installation complete----"
