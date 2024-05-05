#!/usr/bin/env bash
mkdir $HOME/.dotfiles
git config status.showUntrackedFiles no
git init --separate-git-dir=$HOME/.dotfiles
rsync --recursive --verbose --exclude '.git' ./ $HOME/

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule init
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME submodule update

vim +PluginInstall +qall

