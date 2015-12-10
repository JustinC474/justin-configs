#!/bin/bash

script_dir=$(dirname $0)
cd $script_dir
repo_dir=$(pwd)

git submodule init
git submodule update

echo "Backing up dot files in case you want them"
mkdir ~/dotfile-backups
mv ~/.gitconfig ~/dotfile-backups/.gitconfig
mv ~/.oh-my-zsh ~/dotfile-backups/.oh-my-zsh
mv ~/.vim ~/dotfile-backups/.vim
mv ~/.vimrc ~/dotfile-backups/.vimrc
mv ~/.zshrc ~/dotfile-backups/.zshrc

echo "Symlinking to the dotfiles in the $repo_dir folder"
ln -s $repo_dir/.gitconfig ~/.gitconfig
ln -s $repo_dir/.oh-my-zsh ~/.oh-my-zsh
ln -s $repo_dir/.vim ~/.vim
ln -s $repo_dir/.vimrc ~/.vimrc
ln -s $repo_dir/.zshrc ~/.zshrc

echo "Changing the shell to zsh."
chsh -s /bin/zsh
