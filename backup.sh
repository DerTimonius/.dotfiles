#!/bin/zsh
echo "---autoupdating dotfiles---"

cd .dotfiles

echo "updating brew packages"

brew update
brew upgrade

echo "updating Brewfile"

brew bundle dump --force
sed -i "" "/^vscode/d" ./Brewfile

echo "checking for changes in the repo"
changes=$(git status --porcelain)
if [ -n "$changes" ]; then
	echo "changes found, committing"

	git add .
	git commit -m "automated backup of dotfiles"
	git push
else
	echo "No changes detected in the repository."
fi
