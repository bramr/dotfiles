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
ln -s $(pwd)/.vrapperrc ~/.vrapperrc
mkdir -p ~/.config/nvim
mkdir -p ~/Library/Application\ Support/Code/User
ln -s $(pwd)/config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
