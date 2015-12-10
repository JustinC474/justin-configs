#!/bin/bash

script_dir=$(dirname $0)

cd $script_dir

git submodule init
git submodule update

ln -s .gitconfig ~/.gitconfig
ln -s .oh-my-zsh ~/.oh-my-zsh
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc

