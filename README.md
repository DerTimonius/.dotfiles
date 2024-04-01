# .dotfiles

My personal collection of `dotfiles` to save my setup with an added installation script for packages installed via Brew.

## How to use

For a new Mac, with nothing installed, start by installing xcode:

```bash copy
xcode-select --install
```

This installs `git` (among other things), now it's possible to clone this repo.

> I would suggest to place this directory directly into the root directory (so that it's `~/.dotfiles`).

Next, to make sure the script can run, enter the following command:

```bash copy
chmod +x ~/.dotfiles/setup-installation.sh
```

To run the script:

```bash copy
~/.dotfiles/setup-installation.sh
```

The script is written in a way that it does not matter in which directory you currently are.

### Backup

This repo also contains a backup script that upgrades the packages that were installed with brew and create a new `Brewfile`.
It also commits the changes to the repo and pushes it to the remote repo.

```sh copy
chmod +x ~/.dotfiles/backup.sh
~/.dotfiles/backup.sh
```
