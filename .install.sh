#!/bin/bash
mkdir $HOME/.dotfiles
git init --separate-git-dir=$HOME/.dotfiles
rsync --recursive --verbose --exclude '.git' ./ $HOME/

