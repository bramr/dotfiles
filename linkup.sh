#!/bin/bash
mkdir ~/.vim
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
ln -s $(pwd)/.gitk ~/.gitk
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.bash_profile ~/.bash_profile
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.profile ~/.profile
ln -s $(pwd)/.eslintrc.json ~/.eslintrc.json
mkdir -p ~/.config/nvim
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim
