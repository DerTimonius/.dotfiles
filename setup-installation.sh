echo "----Starting setup installation----"
sudo chown -R $(whoami):admin /usr/local

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

echo "----removing old config files and creating new symlinks----"
# remove old config files
sudo rm -rf ~/.gitconfig >/dev/null 2>&1
sudo rm -rf ~/.zshrc >/dev/null 2>&1
sudo rm -rf ~/.bashrc >/dev/null 2>&1
sudo rm -rf ~/.profile >/dev/null 2>&1
# sudo rm -rf ~/.zprofile >/dev/null 2>&1
sudo rm -rf ~/Brewfile >/dev/null 2>&1
sudo rm -rf ~/.warp >/dev/null 2>&1
sudo rm -rf ~/.config/bat >/dev/null 2>&1
sudo rm -rf ~/.config/nvim >/dev/null 2>&1
sudo rm -rf ~/.config/alacritty >/dev/null 2>&1
sudo rm -rf ~/.config/wezterm >/dev/null 2>&1
sudo rm -rf ~/.config/ohmyposh >/dev/null 2>&1
sudo rm -rf ~/.config/zellij >/dev/null 2>&1
sudo rm -rf ~/.config/atuin >/dev/null 2>&1

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

# ln -sf ~/.dotfiles/terminal/.zprofile ~/.zprofile
# SYMLINKS+=('.zprofile ')

ln -sf ~/.dotfiles/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

ln -sf ~/.dotfiles/.warp ~/.warp
SYMLINKS+=('.warp')

mkdir .config
ln -sf ~/.dotfiles/nvim ~/.config/nvim
SYMLINKS+=('nvim')

ln -sf ~/.dotfiles/bat/ ~/.config/bat
SYMLINKS+=('bat')

ln -sf ~/.dotfiles/alacritty/ ~/.config/alacritty
SYMLINKS+=('alacritty')

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
