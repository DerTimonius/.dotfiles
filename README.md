# .dotfiles

My personal collection of `dotfiles` to save my setup with an added installation script for packages installed via Brew.

## How to use

Depending on whether git is already installed or not:

1. Either clone this repo
2. Download the zipped repo

I would suggest to place this directory directly into the root directory (so that it's `~/.dotfiles`).
Next, to make sure the script can run, enter the following command:

```bash copy
chmod +x ~/.dotfiles/setup-installation.sh
```

To run the script:

```bash copy
~/.dotfiles/setup-installation.sh
```

The script is written in a way that it does not matter in which directory you currently are.

## TODO:

- [x] Write installation script
- [ ] Search for more necessary files
