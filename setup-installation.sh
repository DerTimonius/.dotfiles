echo "----Starting setup installation----"
sudo chown -R $(whoami):admin /usr/local

echo "----Installing Xcode Command Line Tools----"
if xcode-select --version &>/dev/null; then
  echo "Xcode is already installed, skipping"
else
  xcode-select --install
  read -p "Press Enter after Xcode Command Line Tools installation is complete to continue"
fi

echo "----Installing Brew----"
if brew help &>/dev/null; then
  echo "Brew is already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
  source ~/.bashrc
fi

brew doctor
brew update


echo "----installing ohmyzsh----"
# install ohmyzsh and the currently used theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "install powerlevel10k theme?"
select theme in Yes No
if [ "$theme" == "Yes" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "----removing old config files and creating new symlinks----"
# remove old config files
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.p10k.zsh > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.profile > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1
sudo rm -rf ~/.warp > /dev/null 2>&1

SYMLINKS=()
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
SYMLINKS+=('.gitconfig')

ln -sf ~/.dotfiles/terminal/.zshrc ~/.zshrc
SYMLINKS+=('.zshrc')

ln -sf ~/.dotfiles/terminal/.p10k.zsh ~/.p10k.zsh
SYMLINKS+=('.p10k.zsh ')

ln -sf ~/.dotfiles/terminal/.bashrc ~/.bashrc
SYMLINKS+=('.bashrc ')

ln -sf ~/.dotfiles/terminal/.profile ~/.profile
SYMLINKS+=('.profile ')

ln -sf ~/.dotfiles/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

ln -sf ~/.dotfiles/.warp ~/.warp
SYMLINKS+=('.warp')

echo "configure neovim?"
select configNvim in Yes No
if [ "$configNvim" == "Yes" ]; then
  echo "----configuring neovim----"
  sudo rm -rf ~/.config/nvim > /dev/null 2>&1
  ln -sf ~/.dotfiles/nvim ~/.config/nvim
  SYMLINKS+=('nvim')
  echo "installing packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

echo ${SYMLINKS[@]}

echo "----install via Brewfile----"
cd ~
brew bundle
cd -

echo "----activating pnpm----"
# activate pnpm and install some global deps
if node --version &>/dev/null; then
  corepack enable
  corepack prepare pnpm@latest --activate
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
