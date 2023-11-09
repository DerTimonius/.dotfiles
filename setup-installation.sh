echo "----Starting setup installation----"
sudo chown -R $(whoami):admin /usr/local

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

options=("Yes" "No")
echo "----installing ohmyzsh----"
# install ohmyzsh and the currently used theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "install powerlevel10k theme?"
select theme in "${options[@]}"; do
  case "$theme" in
    "Yes")
      echo "----installing p10k theme----"
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
      ;;
    "No")
      echo "No theme installed"
      break
      ;;
    *)
      echo "Invalid option. Please select 1 for Yes or 2 for No."
      ;;
  esac
done

echo "----removing old config files and creating new symlinks----"
# remove old config files
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.p10k.zsh > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.profile > /dev/null 2>&1
sudo rm -rf ~/.zprofile > /dev/null 2>&1
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

ln -sf ~/.dotfiles/terminal/.zprofile ~/.zprofile
SYMLINKS+=('.zprofile ')

ln -sf ~/.dotfiles/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

ln -sf ~/.dotfiles/.warp ~/.warp
SYMLINKS+=('.warp')

echo "configure neovim?"
select configNvim in "${options[@]}"; do
  case "$configNvim" in
    "Yes")
      echo "----configuring neovim----"
      sudo rm -rf ~/.config/nvim > /dev/null 2>&1
      ln -sf ~/.dotfiles/nvim ~/.config/nvim
      SYMLINKS+=('nvim')
      break
      ;;
    "No")
      echo "No configuration for neovim."
      break
      ;;
    *)
      echo "Invalid option. Please select 1 for Yes or 2 for No."
      ;;
  esac
done

echo "The following symlinks have been created:\n"
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
