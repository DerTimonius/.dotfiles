#!/bin/bash

echo "----Starting setup installation----"
sudo chown -R $(whoami):admin /usr/local

read -p "Do you want to install Brew (if it is not installed yet) and all packages based on the Brewfile? (y/n) " install_input

if [[ $install_input == "y" ]]; then
  ./install.sh
else
  echo "skipping installation of packages"
fi

read -p "Do you want to remove old config files and create symlinks? (y/n) " symlinks_input

if [[ $symlinks_input == "y" ]]; then
  ./create-symlinks.sh
else
  echo "skipping creation of symlinks"
fi

echo "----Setup complete----"
