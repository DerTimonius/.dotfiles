echo "----Starting setup installation----"

sudo chown -R $(whoami):admin /usr/local
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update

echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
source ~/.bashrc

echo "----installing ohmyzsh----"
# install ohmyzsh and the currently used theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "----install via Brewfile----"
cd ~
brew bundle
cd -

echo "----activating pnpm----"
# activate pnpm and install some global deps
if node --version &>/dev/null; then
  corepack enable
  corepack prepare pnpm@latest --activate
  pnpm add -g @antfu/ni
else
  echo "Node not installed correctly, please check and activate pnpm manually"
fi

echo "----removing old config files and creating new symlinks----"
# remove old config files
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.p10k.zsh > /dev/null 2>&1
sudo rm -rf ~/fig/.bashrc > /dev/null 2>&1
sudo rm -rf ~/fig/.profile > /dev/null 2>&1

SYMLINKS=()
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
SYMLINKS+=('.gitconfig')

ln -sf ~/.dotfiles/terminal/.zshrc ~/.zshrc
SYMLINKS+=('.zshrc')

ln -sf ~/.dotfiles/terminal/.p10k.zsh ~/.p10k.zsh
SYMLINKS+=('.p10k.zsh ')

ln -sf ~/.dotfiles/terminal/fig/.bashrc ~/.bashrc
SYMLINKS+=('.bashrc ')

ln -sf ~/.dotfiles/terminal/fig/.profile ~/.profile
SYMLINKS+=('.profile ')

echo ${SYMLINKS[@]}

echo "----Installation complete----"
